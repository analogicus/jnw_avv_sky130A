`default_nettype none

module tmpDig (
    input wire clk,
    input wire reset,
    input wire cmp,
    input wire tmpPulse,

    output logic PI1,
    output logic PI2,
    output logic dummy,
    output logic PII1,
    output logic PII2,

    output logic PA,
    output logic PB,
    output logic PC,
    output logic PD,

    output logic s_BG2CMP,
    output logic s_BgCtrl,
    output logic s_PtatCtrl,
    output logic s_Cap2CMP,
    output logic s_Ref2CMP,
    output logic s_CapRst,
    output logic s_PtatOut,
    output logic s_Rdiscon_N,
    output logic s_CCOcap1,
    output logic s_CCOcap2,

    output logic src_n,
    output logic snk,

    output logic cmp_p1,
    output logic cmp_p2,

    output logic PwrUp,

    output logic valid,
    output logic preChrg,
    output logic setupBias,
    
    output logic [7:0] tmpCount_out1,
    output logic [7:0] tmpCount_out2,
    output logic tmpCountRst_out,
    output logic [7:0] count_out,
    output logic [8:0] tmpSampleCount_out
    );

assign tmpCount_out2 = tmpCount2;
assign tmpCount_out1 = tmpCount1;
assign tmpCountRst_out = tmpCountRst;
assign count_out = count;

assign tmpSampleCount_out = tmpSampleCount;

typedef enum logic [2:0] {
    PRECHARGECHILD,
    DIODE,
    BIGDIODE,
    HCHARGE,
    LCHARGE,
    OUTPUT,
    BLANKDIODE,
    BLANKBIGDIODE
} childState_t;

childState_t afterBlank, childState;

typedef enum logic [2:0] {
    SLEEP,
    PRECHARGEPARENT,
    BANDGAP,
    PTAT,
    TEMPSENS,
    BGSETUP
} parentState_t;

parentState_t parentState;

logic [7:0] count;
logic [8:0] tmpSampleCount;
logic [5:0] stateCount;
logic [7:0] tmpCount1;
logic [7:0] tmpCount2;
logic       Hcharged;
logic       Lcharged;
logic [6:0] setupDone;
logic       intermCmp;
logic       enable_cmp_toggle;
logic       cmp_p1_fsm;
logic       cmp_p1_async;
logic       lastPTATcmp;
logic       tmpCountRst;
logic       rst;
logic       s_CCOcap2_reset;
logic       goToEternalSleep;


task automatic do_BLANKBIGDIODE();
    count <= 0;
    PA <= 0;
    PB <= 0;
    PC <= 0;
    PD <= 0;
    if (afterBlank == BIGDIODE) begin
        intermCmp <= cmp;
        PI1 <= 1;
    end else begin
        PI1 <= 0;
    end
    childState <= afterBlank;
    if (afterBlank == BLANKDIODE) begin
        afterBlank <= DIODE;
    end
endtask

task automatic do_BLANKDIODE();
    count <= 0;
    PA <= 0;
    PB <= 0;
    PC <= 0;
    PD <= 0;
    if (afterBlank == DIODE) begin
        PII1 <= 1;
    end else begin
        PII1 <= 0;
    end
    childState <= afterBlank;
    if (afterBlank == BLANKBIGDIODE) begin
        afterBlank <= BIGDIODE;
    end
endtask

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        tmpSampleCount <= 0;
    end else if (s_CapRst == 0) begin
        tmpSampleCount <= tmpSampleCount + 1;
    end else begin
        tmpSampleCount <= 0;
    end
end

always_ff @(posedge clk or posedge reset) begin
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end


always_ff @(posedge clk) begin
    if (rst) begin
        do_reset_FSM();
        parentState <= PRECHARGEPARENT;
        childState <= PRECHARGECHILD;
    end else begin

/////////////////// BGSETUP /////////////////////////

        if (parentState == BGSETUP) begin
            s_CapRst <= 1;
            s_BgCtrl <= 1;
            s_Rdiscon_N <= 1;
            s_BG2CMP <= 1;
            case(childState)
                DIODE: begin
                    count <= count + 1; 
                    PII2 <= 1;
                    if(count > 1) begin
                        cmp_p1_fsm <= ~cmp_p1_fsm;
                        PII2  <= 0;
                        count <= 0;
                        afterBlank <= BLANKBIGDIODE;
                        childState <= BLANKDIODE;
                    end
                end

                BIGDIODE: begin
                    count <= count + 1;
                    PI2  <= 1;
                    if (cmp == intermCmp ) begin
                        if (cmp) begin
                            src_n <= 1;
                            snk <= 0;
                        end else begin
                            src_n <= 0;
                            snk <= 1;
                            stateCount <= stateCount + 1;
                        end
                        if (count > 30) begin
                            count <= 0;
                            PI2  <= 0;
                            snk <= 0;
                            src_n <= 0;
                            childState <= BLANKBIGDIODE;
                            afterBlank <= BLANKDIODE;
                        end else begin
                            childState <= BIGDIODE;
                        end
                    end else if (count > 5) begin
                        snk <= 0;
                        src_n <= 0;
                        count <= 0;
                        childState <= BLANKBIGDIODE;
                        PI2  <= 0;
                        if (stateCount > 1) begin
                            afterBlank <= OUTPUT;
                            stateCount <= 0;
                        end else begin
                            afterBlank <= BLANKDIODE;
                        end
                    end else begin
                        count <= count + 1;
                    end
                end

                OUTPUT: begin
                    count <= count + 1;
                    PA <= 1;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    if (count > 15) begin
                        parentState <= BANDGAP;
                        childState <= BLANKBIGDIODE; 
                        afterBlank <= BIGDIODE;
                        stateCount <= 0;
                        PA <= 0;
                        PB <= 0;
                        PC <= 0;
                        PD <= 0;
                    end else begin
                        childState <= OUTPUT;
                    end
                end

                BLANKBIGDIODE: begin
                    do_BLANKBIGDIODE();
                end

                BLANKDIODE: begin
                    do_BLANKDIODE();
                end

                default: begin
                    childState <= PRECHARGECHILD;
                    parentState <= PRECHARGEPARENT;
                end
            endcase
        end

/////////////////// BANDGAP /////////////////////////

        else if (parentState == BANDGAP) begin
            s_CapRst <= 1;
            s_BgCtrl <= 1;
            s_Rdiscon_N <= 1;
            s_BG2CMP <= 1;
            case(childState)
                DIODE: begin
                    count <= count + 1; 
                    PII2 <= 1;
                    if(count > 4) begin
                        cmp_p1_fsm <= ~cmp_p1_fsm;
                        PII2  <= 0;
                        count <= 0;
                        childState <= BLANKDIODE;
                        afterBlank <= OUTPUT;
                        if (!Hcharged) begin
                            afterBlank <= HCHARGE;
                            childState <= BLANKDIODE;
                        end else begin
                            afterBlank <= LCHARGE;
                            childState <= BLANKDIODE;
                        end

                    end
                end

                BIGDIODE: begin
                    count <= count + 1;
                    PI2  <= 1;
                    if (cmp == intermCmp ) begin
                        if (cmp) begin
                            src_n <= 1;
                            snk <= 0;
                        end else begin
                            src_n <= 0;
                            snk <= 1;
                        end
                        if (count > 10) begin
                            count <= 0;
                            PI2  <= 0;
                            snk <= 0;
                            src_n <= 0;
                            childState <= BLANKBIGDIODE;
                            afterBlank <= BLANKDIODE;
                        end else begin
                            childState <= BIGDIODE;
                        end
                        if (count > 20) begin
                            count <= 0;
                            PI2  <= 0;
                            snk <= 0;
                            src_n <= 0;
                            childState <= BLANKBIGDIODE;
                            afterBlank <= BLANKDIODE;
                        end else begin
                            childState <= BIGDIODE;
                        end
                    end else if (count > 9) begin
                        count <= 0;
                        PI2  <= 0;
                        snk <= 0;
                        src_n <= 0;
                        childState <= BLANKBIGDIODE;
                        afterBlank <= BLANKDIODE;
                    end else begin
                        count <= count + 1;
                    end
                end

                HCHARGE: begin
                    count <= count + 1;
                    PA <= 1;
                    PB <= 1;
                    if (count > 4) begin
                        intermCmp <= cmp;
                        count <= 0;
                        if (Lcharged == 1) begin
                            childState <= OUTPUT;
                            PA <= 0;
                            PB <= 0;
                        end else begin
                            Hcharged <= 1;
                            childState <= BLANKBIGDIODE;
                            afterBlank <= BIGDIODE;
                        end
                    end
                end

                LCHARGE: begin
                    count <= count + 1;
                    PA <= 1;
                    PC <= 1;
                    if (count > 4) begin
                        count <= 0;
                        intermCmp <= cmp;
                        if (Hcharged == 1 ) begin
                            PA <= 0;
                            PC <= 0;
                            childState <= OUTPUT;
                        end else begin
                            Lcharged <= 1;
                            childState <= BLANKBIGDIODE;
                            afterBlank <= BIGDIODE;
                        end
                    end
                end

                OUTPUT: begin
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    Lcharged <= 0;
                    Hcharged <= 0;
                    if (count > 3) begin
                        count <= 0;
                        stateCount <= stateCount + 1;
                        if (stateCount > 10) begin
                            parentState <= PTAT;
                            afterBlank <= BLANKBIGDIODE;
                            childState <= BLANKDIODE;
                            stateCount <= 0;
                            s_BgCtrl <= 0;
                            s_Rdiscon_N <= 0;
                            count <= 0;
                            PA <= 0;
                            PB <= 0;
                            PC <= 0;
                            PD <= 0;
                        end else begin
                            childState <= BLANKBIGDIODE;
                            afterBlank <= BIGDIODE;
                        end
                    end else begin
                        count <= count + 1;
                    end
                end

                BLANKDIODE: begin
                    do_BLANKDIODE();
                end

                BLANKBIGDIODE: begin
                    do_BLANKBIGDIODE();
                end

                default: begin
                    childState <= PRECHARGECHILD;
                    parentState <= PRECHARGEPARENT;
                end
            endcase
        end

//////////////////// PTAT ///////////////////////////

        else if (parentState == PTAT) begin
            s_CapRst <= 1;
            s_PtatCtrl <= 1;
            s_Rdiscon_N <= 0;
            s_BG2CMP <= 1;
            case(childState)
                BLANKDIODE: begin
                    count <= 0;
                    if (afterBlank == DIODE) begin
                        PII1 <= 1;
                    end else begin
                        PII1 <= 0;
                        if (stateCount > 6 && cmp != lastPTATcmp) begin
                            lastPTATcmp <= cmp;
                            parentState <= TEMPSENS;
                            s_BG2CMP <= 0;
                            s_CapRst <= 1;
                            s_PtatOut <= 1;
                            stateCount <= 0;
                            if (lastPTATcmp) begin
                                cmp_p1_fsm <= 1;
                            end else begin
                                cmp_p1_fsm <= 0;
                            end
                        end
                    end
                    childState <= afterBlank;
                    if (afterBlank == BLANKBIGDIODE) begin
                        afterBlank <= BIGDIODE;
                    end
                end

                DIODE: begin
                    PII2 <= 1;
                    if(count > 4) begin
                        stateCount <= stateCount + 1;
                        PII2  <= 0;
                        count <= 0;
                        cmp_p1_fsm <= ~cmp_p1_fsm;
                        afterBlank <= BLANKBIGDIODE;
                        childState <= BLANKDIODE;
                    end else begin
                        count <= count + 1; 
                    end
                end

                BIGDIODE: begin
                    count <= count + 1;
                    PI2  <= 1;
                    if (cmp == intermCmp ) begin
                        if (cmp) begin
                            src_n <= 1;
                            snk <= 0;
                        end else begin
                            src_n <= 0;
                            snk <= 1;
                        end
                    end else if (count > 9) begin
                        count <= 0;
                        PI2  <= 0;
                        snk <= 0;
                        src_n <= 0;
                        childState <= BLANKBIGDIODE;
                        afterBlank <= BLANKDIODE;
                    end else begin
                        count <= count + 1;
                    end
                end

                BLANKBIGDIODE: begin
                    do_BLANKBIGDIODE();
                end

                default: begin
                    childState <= PRECHARGECHILD;
                    parentState <= PRECHARGEPARENT;
                end
            endcase
        end

////////////////// TEMPSENS /////////////////////////

        else if (parentState == TEMPSENS) begin
            s_PtatCtrl <= 1;
            s_CapRst <= 0;
            s_Cap2CMP <= 1;
            s_Ref2CMP <= 1;
            enable_cmp_toggle <= 1;
            tmpCountRst <= 0;
            if (tmpSampleCount > 225) begin
                s_BgCtrl <= 0;
                s_Cap2CMP <= 0;
                s_Ref2CMP <= 0;
                s_CapRst <= 1;
                s_PtatOut <= 0;
                if (tmpCount1 > 0 && tmpCount2 > 0) begin
                    parentState <= SLEEP;
                    enable_cmp_toggle <= 0;
                    s_PtatCtrl <= 0;
                end else begin
                    parentState <= PTAT;
                    afterBlank <= BLANKBIGDIODE;
                    childState <= BLANKDIODE;
                    s_Rdiscon_N <= 0;
                end
                count <= 0;
            end else begin
                parentState <= TEMPSENS;
            end
        end

/////////////////// SLEEP ///////////////////////////

        else if (parentState == SLEEP) begin
            s_CapRst <= 1;
            PwrUp <= 0;
            if (goToEternalSleep == 0) begin
                count <= count + 1;
                if (count > 10) begin
                    parentState <= BANDGAP;
                    childState <= BLANKBIGDIODE;
                    afterBlank <= BIGDIODE;
                    count <= 0;
                    PwrUp <= 1;
                    goToEternalSleep <= 1;
                    if (tmpCount1 > 0 && tmpCount2 > 0) begin
                        tmpCountRst <= 1;
                    end 
                end else begin
                    parentState <= SLEEP;
                end
            end else begin
                parentState <= SLEEP;
            end
        end

///////////////// PRECHARGE /////////////////////////

        else begin
            s_CapRst <= 1;
            case(childState)
                PRECHARGECHILD: begin
                    do_precharge();
                    if (count > 14) begin
                        childState <= BLANKDIODE;
                        afterBlank <= DIODE;
                        PII1 <= 1;
                        count <= 0;
                        preChrg <= 0;
                        cmp_p1_fsm <= ~cmp_p1_fsm;
                        preChrg <= 0;
                        s_PtatCtrl <= 0;
                    end else begin
                        count <= count + 1;
                        preChrg <= 1;
                    end
                end

                DIODE: begin
                    if (PII1 == 1) begin
                        count <= count + 1; 
                        PII2 <= 1;
                        if(count > 5) begin
                            childState <= BLANKDIODE;
                            afterBlank <= BLANKBIGDIODE;
                            PII2  <= 0;
                        end else begin
                            childState <= DIODE;
                        end
                    end else begin
                        count <= 0;
                        childState <= BLANKDIODE;
                        afterBlank <= DIODE;
                    end
                end

                BLANKBIGDIODE: begin
                        count <= 0;
                        PA <= 0;
                        PB <= 0;
                        PC <= 0;
                        PD <= 0;
                        if (afterBlank == BIGDIODE) begin
                            PI1 <= 1;
                        end else begin
                            PI1 <= 0;
                        end
                        childState <= afterBlank;
                        if (afterBlank == BLANKDIODE) begin
                            parentState <= BANDGAP;
                            childState <= BLANKBIGDIODE;
                            afterBlank <= BIGDIODE;
                        end
                end

                BIGDIODE: begin
                    if (PI1 == 1) begin
                        count <= count + 1;
                        PI2 <= 1;
                        s_BG2CMP <= 1;
                        if (count > 14) begin
                            parentState <= BGSETUP;
                            childState <= BIGDIODE;
                            intermCmp <= cmp;
                        end else begin
                        childState <= BIGDIODE;
                        end
                    end else begin
                        childState <= BLANKBIGDIODE;
                        afterBlank <= BIGDIODE;
                    end
                end

                BLANKDIODE: begin
                    do_BLANKDIODE();
                end

                default: begin
                    childState <= PRECHARGECHILD;
                    parentState <= PRECHARGEPARENT;
                end
            endcase
        end
    end
end



// Purpose: When in TEMPSENS state, count positive edges of cmp.
//          And toggle chopping on every rising edge of CMP.
always @(posedge cmp or posedge reset or posedge tmpCountRst) begin
    if (s_CCOcap1 == s_CCOcap2) begin
        s_CCOcap1 <= ~s_CCOcap1;
    end
    
    if (reset) begin
        s_CCOcap1 <= 0;
        s_CCOcap2 <= 1;
        tmpCount1 <= 0;
        tmpCount2 <= 0;

    end else if (s_CapRst == 0) begin
        s_CCOcap1 <= ~s_CCOcap1;
        s_CCOcap2 <= ~s_CCOcap2;

        if (lastPTATcmp == 1) begin
            tmpCount1 <= tmpCount1 + 1;
        end else begin
            tmpCount2 <= tmpCount2 + 1;
        end 
    end else if (tmpCountRst) begin
        tmpCount1 <= 0;
        tmpCount2 <= 0;
    end
end



// always @(posedge cmp or posedge reset) begin
//     if (reset) begin
//         s_CCOcap1 <= 0;
//         s_CCOcap2 <= 1;
//     end else if (s_CapRst == 0) begin
//         s_CCOcap1 <= ~s_CCOcap1;
//         s_CCOcap2 <= ~s_CCOcap2;
//     end 
// end

// assign cmp_p1 = enable_cmp_toggle ? cmp_p1_async : cmp_p1_fsm;
assign cmp_p1 = cmp_p1_fsm;
assign cmp_p2 = ~cmp_p1;


// Purpose: Tie CMP output high for 1-2 clk cycles after cmp goes high
//          to avoid the glitches from chopping the CMP to toggle the always block above
// always @(posedge clk or posedge cmp or posedge reset) begin
//     if (reset) begin
//         CmpOutDisable_reg <= 1'b0;
//     end else if (s_CmpOutDisable) begin // sync clear
//         CmpOutDisableCount <= CmpOutDisableCount + 1;
//         if (CmpOutDisableCount > 0) begin
//             CmpOutDisable_reg <= 1'b0;
//             CmpOutDisableCount <= 0;
//         end
//     end else if (cmp && parentState == TEMPSENS) begin // async set
//         CmpOutDisable_reg <= 1'b1;
//     end
// end

// assign s_CmpOutDisable = CmpOutDisable_reg;


task automatic do_precharge();
    PI1 <= 0;
    PI2 <= 0;
    PII1 <= 0;
    PII2 <= 0;

    PA <= 0;
    PB <= 1;
    PC <= 1;
    PD <= 1;

    s_BgCtrl <= 1;
    s_PtatCtrl <= 1;

    s_BG2CMP <= 0;
    s_Cap2CMP <= 0;
    s_Ref2CMP <= 0;
    s_CapRst <= 1;
    s_PtatOut <= 0;
    s_Rdiscon_N <= 1;

    src_n <= 0;
    snk <= 0;

    PwrUp <= 1;
    preChrg <= 1;
    count <= 0;
    stateCount <= 0;
    Hcharged <= 0;
    Lcharged <= 0;
    intermCmp <= 0;
    enable_cmp_toggle <= 0;
    lastPTATcmp <= 0;
    tmpCountRst <= 0;
    cmp_p1_fsm <= 0;
    goToEternalSleep <= 0;
endtask

task automatic do_reset_FSM();
    PI1 <= 0;
    PI2 <= 0;
    PII1 <= 0;
    PII2 <= 0;

    PA <= 0;
    PB <= 0;
    PC <= 0;
    PD <= 0;

    s_BgCtrl <= 0;
    s_PtatCtrl <= 0;

    s_BG2CMP <= 0;
    s_Cap2CMP <= 0;
    s_Ref2CMP <= 0;
    s_CapRst <= 0;
    s_PtatOut <= 0;
    s_Rdiscon_N <= 0;

    src_n <= 0;
    snk <= 0;

    PwrUp <= 0;
    preChrg <= 0;
    count <= 0;
    stateCount <= 0;
    Hcharged <= 0;
    Lcharged <= 0;
    intermCmp <= 0;
    enable_cmp_toggle <= 0;
    lastPTATcmp <= 0;
    tmpCountRst <= 0;
    cmp_p1_fsm <= 0;
    goToEternalSleep <= 0;
endtask



endmodule
