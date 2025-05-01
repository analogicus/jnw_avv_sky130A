`default_nettype none

module tmpDig (
    input wire clk,
    input wire reset,
    input wire cmp,
    input wire tmpPulse,

    output logic PI1,
    output logic PI2,
    output logic PII1,
    output logic dummy,
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

    output logic src_n,
    output logic snk,

    output logic cmp_p1,
    output logic cmp_p2,

    output logic rst,
    output logic valid,
    output logic preChrg,
    output logic setupBias
    );


parameter   PRECHARGE=0,
            DIODE=1,
            BIGDIODE=2,
            HCHARGE=3,
            LCHARGE=4,
            OUTPUT=5,
            BLANKDIODE=6,
            BLANKBIGDIODE=7;

parameter   BGSETUP=0,
            PTATSETUP=1,
            BANDGAP=2,
            PTAT=3,
            TEMPSENS=4;

logic [3:0] state;
logic [3:0] syState;
logic [3:0] afterBlank;
logic [5:0] count;
logic [5:0] setupCount;
logic [5:0] stateCount;
logic       Hcharged;
logic       Lcharged;
logic [6:0] setupDone;
logic       src_ctrl;

always_ff @(posedge clk or posedge reset) begin
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end

initial begin
    syState = PRECHARGE;
    state = PRECHARGE;
    syState = BGSETUP;
    cmp_p1 = 1'b1;
    cmp_p2 = 1'b0;
    snk_ctrl = 1'b0;
    src_ctrl = 1'b0;
    s_BG2CMP = 1'b0;
    s_BgCtrl = 1'b0;
    s_PtatCtrl = 1'b0;
    s_Cap2CMP = 1'b0;
    s_Ref2CMP = 1'b0;
    s_CapRst = 1'b0;
    s_PtatOut = 1'b0;
    s_Rdiscon_N = 1'b1;
    preChrg = 1'b0;
    setupBias = 1'b0;
    setupDone = 0;
    count = 0;
end


always_ff @(posedge clk) begin
    if (rst) begin
        state <= PRECHARGE;
    end
    else begin

/////////////////// BGSETUP /////////////////////////

        if (syState == BGSETUP) begin
            s_BgCtrl <= 1;
            s_Rdiscon_N <= 1;
            case(state)
                PRECHARGE: begin
                    s_PtatCtrl <= 1;
                    s_BG2CMP <= 1;
                    PI2 <= 0;
                    PII2 <= 0;
                    PII1 <= 0;
                    PI1 <= 0;
                    PA <= 0;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    valid <= 0;
                    Hcharged <= 0;
                    Lcharged <= 0;
                    s_Cap2CMP <= 0;
                    s_Ref2CMP <= 0;
                    s_CapRst <= 1;
                    s_PtatOut <= 0;
                    s_Rdiscon_N <= 1;
                    stateCount <= 0;

                    if (count > 15) begin
                        state <= BLANKBIGDIODE;
                        afterBlank <= BIGDIODE;
                        count <= 0;
                        preChrg <= 0;
                        s_PtatCtrl <= 0;
                        cmp_p1 <= ~cmp_p1;
                        cmp_p2 <= ~cmp_p2;
                    end else begin
                        count <= count + 1;
                        preChrg <= 1;
                        setupBias <= 1;
                    end
                end

                BLANKDIODE: begin
                    preChrg <= 0;
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
                    state <= afterBlank;
                    if (afterBlank == BLANKBIGDIODE) begin
                        afterBlank <= BIGDIODE;
                    end
                end

                DIODE: begin
                    count <= count + 1; 
                    PII2 <= 1;
                    if(count > 7) begin
                        cmp_p1 <= ~cmp_p1;
                        cmp_p2 <= ~cmp_p2;
                        PII2  <= 0;
                        count <= 0;
                        if (setupDone > 0) begin
                            if (setupDone == 1) begin
                                state <= BLANKDIODE;
                                afterBlank <= OUTPUT;
                            end else if (!Hcharged) begin
                                afterBlank <= HCHARGE;
                                state <= BLANKDIODE;
                            end else begin
                                afterBlank <= LCHARGE;
                                state <= BLANKDIODE;
                            end
                        end else begin
                            afterBlank <= BLANKBIGDIODE;
                            state <= BLANKDIODE;
                        end
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
                    state <= afterBlank;
                    if (afterBlank == BLANKDIODE) begin
                        afterBlank <= DIODE;
                    end
                end

                BIGDIODE: begin
                    count <= count + 1;
                    PI2  <= 1;
                    if (count > 5) begin
                        PI2  <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= BLANKDIODE;
                    end else begin
                        state <= BIGDIODE;
                    end

                    if (cmp) begin
                        src_ctrl <= ~src_ctrl;	
                    end else begin
                        setupCount <= setupCount + 1;
                        if (setupCount > 3) begin
                            afterBlank <= OUTPUT;
                            state <= BLANKBIGDIODE;
                            PI2 <= 0;
                            s_PtatCtrl <= 0;
                            setupCount <= 0;
                        end
                        snk_ctrl <= ~snk_ctrl;
                    end
                end

                OUTPUT: begin
                    count <= count + 1;
                    PA <= 1;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    if (count > 15) begin
                        syState <= PTATSETUP;
                        state <= BLANKBIGDIODE; 
                        afterBlank <= BIGDIODE;
                        s_BgCtrl <= 0;
                        PA <= 0;
                        PB <= 0;
                        PC <= 0;
                        PD <= 0;
                    end else begin
                        state <= OUTPUT;
                    end
                end
            endcase
        end

////////////////// PTATSETUP ////////////////////////

        else if (syState == PTATSETUP) begin
            s_PtatCtrl <= 1;
            s_Rdiscon_N <= 0;
            case(state)
                BLANKDIODE: begin
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
                    state <= afterBlank;
                    if (afterBlank == BLANKBIGDIODE) begin
                        afterBlank <= BIGDIODE;
                    end
                end

                DIODE: begin
                    count <= count + 1; 
                    PII2 <= 1;
                    if(count > 1) begin
                        cmp_p1 <= ~cmp_p1;
                        cmp_p2 <= ~cmp_p2;
                        PII2  <= 0;
                        count <= 0;
                        afterBlank <= BLANKBIGDIODE;
                        state <= BLANKDIODE;
                    end
                end

                BLANKBIGDIODE: begin
                    PA <= 0;
                    PB <= 0;
                    PC <= 0;
                    PD <= 0;
                    count <= 0;
                    if (afterBlank == BIGDIODE) begin
                        PI1 <= 1;
                    end else begin
                        PI1 <= 0;
                    end

                    if (afterBlank == HCHARGE) begin
                        syState <= BANDGAP;
                        s_PtatCtrl <= 0;
                    end else begin
                        syState <= PTATSETUP;
                    end

                    state <= afterBlank;
                    if (afterBlank == BLANKDIODE) begin
                        afterBlank <= DIODE;
                    end
                end

                BIGDIODE: begin
                    count <= count + 1;
                    PI2  <= 1;
                    if (count > 5) begin
                        PI2  <= 0;
                        snk <= 0;
                        src_n <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= BLANKDIODE;
                    end else begin
                        count <= count + 1;
                    end

                    if (cmp) begin
                        src_ctrl <= ~src_ctrl;	
                    end else begin
                        setupCount <= setupCount + 1;
                        if (setupCount > 3) begin
                            afterBlank <= HCHARGE;
                            state <= BLANKBIGDIODE;
                            PI2 <= 0;
                            setupBias <= 0;
                            s_PtatCtrl <= 0;
                            setupCount <= 0;
                            stateCount <= 0;
                        end
                        snk_ctrl <= ~snk_ctrl;
                    end
                end
            endcase
        end

/////////////////// BANDGAP /////////////////////////

        else if (syState == BANDGAP) begin
            s_BgCtrl <= 1;
            s_Rdiscon_N <= 1;
            case(state)
                BLANKDIODE: begin
                    preChrg <= 0;
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
                    state <= afterBlank;
                    if (afterBlank == BLANKBIGDIODE) begin
                        afterBlank <= BIGDIODE;
                    end
                end

                DIODE: begin
                    count <= count + 1; 
                    PII2 <= 1;
                    if(count > 7) begin
                        cmp_p1 <= ~cmp_p1;
                        cmp_p2 <= ~cmp_p2;
                        PII2  <= 0;
                        count <= 0;
                        state <= BLANKDIODE;
                        afterBlank <= OUTPUT;
                        if (!Hcharged) begin
                            afterBlank <= HCHARGE;
                            state <= BLANKDIODE;
                        end else begin
                            afterBlank <= LCHARGE;
                            state <= BLANKDIODE;
                        end

                    end
                end


                BLANKBIGDIODE: begin
                    PA <= 0;
                    PB <= 0;
                    PC <= 0;
                    PD <= 0;
                    if (afterBlank == BIGDIODE) begin
                        PI1 <= 1;
                    end else begin
                        PI1 <= 0;
                    end
                    state <= afterBlank;
                    if (afterBlank == BLANKDIODE) begin
                        afterBlank <= DIODE;
                    end
                end

                BIGDIODE: begin
                    count <= count + 1;
                    PI2  <= 1;
                    if (count == 0) begin
                        if (intermCmp) begin
                            src_ctrl <= ~src_ctrl;
                        end else begin
                            snk_ctrl <= ~snk_ctrl;
                        end
                    end else if (count > 10) begin
                        PI2  <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= BLANKDIODE;
                    end
                end

                HCHARGE: begin
                    count <= count + 1;
                    PA <= 1;
                    PB <= 1;
                    s_BG2CMP <= 1;
                    if (count > 4) begin
                        intermCmp <= cmp;
                        s_BG2CMP <= 0;
                        count <= 0;
                        if (Lcharged == 1) begin
                            state <= OUTPUT;
                            PA <= 0;
                            PB <= 0;
                        end else begin
                            Hcharged <= 1;
                            state <= BLANKBIGDIODE;
                            afterBlank <= BIGDIODE;
                        end
                    end
                end

                LCHARGE: begin
                    count <= count + 1;
                    PA <= 1;
                    PC <= 1;
                    s_BG2CMP <= 1;
                    if (count > 4) begin
                        count <= 0;
                        intermCmp <= cmp;
                        s_BG2CMP <= 0;
                        if (Hcharged == 1 ) begin
                            PA <= 0;
                            PC <= 0;
                            state <= OUTPUT;
                        end else begin
                            Lcharged <= 1;
                            state <= BLANKBIGDIODE;
                            afterBlank <= BIGDIODE;
                        end
                    end
                end

                OUTPUT: begin
                    stateCount <= stateCount + 1;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    Lcharged <= 0;
                    Hcharged <= 0;
                    if (stateCount > 5) begin
                        syState <= PTAT;
                        afterBlank <= BLANKBIGDIODE;
                        state <= BLANKDIODE;
                        stateCount <= 0;
                        s_BG2CMP <= 0;
                        s_BgCtrl <= 0;
                        s_Rdiscon_N <= 0;
                        PA <= 0;
                        PB <= 0;
                        PC <= 0;
                        PD <= 0;
                    end else begin
                        state <= BLANKBIGDIODE;
                        afterBlank <= BIGDIODE;
                        s_BG2CMP <= 1;
                    end
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    Lcharged <= 0;
                    Hcharged <= 0;
                end
        endcase


//////////////// PRECHARGE /////////////////

        end else begin
            case(state)
                PRECHARGE: begin
                    if (count > 14) begin
                        state <= BLANKDIODE;
                        afterBlank <= DIODE;
                        count <= 0;
                        preChrg <= 0;
                        cmp_p1 <= ~cmp_p1;
                        cmp_p2 <= ~cmp_p2;
                        preChrg <= 0;
                    end
                    else begin
                        count <= count + 1;
                        preChrg <= 1;
                        setupBias <= 1;
                    end
                    s_BG2CMP <= 1;
                    PI2 <= 0;
                    PII2 <= 0;
                    PII1 <= 0;
                    PI1 <= 0;
                    PA <= 0;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    valid <= 0;
                    Hcharged <= 0;
                    Lcharged <= 0;
                end
            endcase
        end

//////////////////// PTAT ///////////////////////////

        else if (syState == PTAT) begin
            s_PtatCtrl <= 1;
            s_Rdiscon_N <= 0;
            case(state)
                BLANKDIODE: begin
                    count <= 0;
                    if (afterBlank == DIODE) begin
                        PII1 <= 1;
                    end else begin
                        PII1 <= 0;
                        if (stateCount > 15) begin
                            syState <= TEMPSENS;
                            s_BG2CMP <= 0;
                            s_PtatCtrl <= 1;
                            s_Cap2CMP <= 1;
                            s_Ref2CMP <= 1;
                            s_CapRst <= 1;
                            s_PtatOut <= 1;
                        end
                    end
                    state <= afterBlank;
                    if (afterBlank == BLANKBIGDIODE) begin
                        afterBlank <= BIGDIODE;
                    end
                end

                DIODE: begin
                    count <= count + 1; 
                    PII2 <= 1;
                    if(count > 7) begin
                        stateCount <= stateCount + 1;
                        PII2  <= 0;
                        count <= 0;
                        afterBlank <= BLANKBIGDIODE;
                        state <= BLANKDIODE;
                        s_BG2CMP <= 1;
                    end
                end


                BLANKBIGDIODE: begin
                    count <= count + 1;
                    if (afterBlank == BIGDIODE) begin
                        PI1 <= 1;
                        intermCmp <= cmp;
                    end else begin
                        PI1 <= 0;
                        cmp_p1 <= ~cmp_p1;
                        cmp_p2 <= ~cmp_p2;
                    end
                    if (count > 1) begin
                        state <= afterBlank;
                        s_BG2CMP <= 0;
                        count <= 0;
                        if (afterBlank == BLANKDIODE) begin
                            afterBlank <= DIODE;
                        end
                    end
                end

                BIGDIODE: begin
                    count <= count + 1;
                    PI2  <= 1;
                    if (count == 0) begin
                        if (intermCmp) begin
                            src_ctrl <= ~src_ctrl;
                        end else begin
                            snk_ctrl <= ~snk_ctrl;
                        end
                    end else if (count > 25) begin
                        PI2  <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= BLANKDIODE;
                    end
                end
            endcase
        end

////////////////// TEMPSENS /////////////////////////

        else if (syState == TEMPSENS) begin
            s_PtatCtrl <= 1;
            s_CapRst <= 0;
            if (!tmpPulse) begin
                syState <= BANDGAP;
                state <= BLANKBIGDIODE;
                afterBlank <= BIGDIODE;
                s_BgCtrl <= 1;
                s_PtatCtrl <= 0;
                s_Cap2CMP <= 0;
                s_Ref2CMP <= 0;
                s_CapRst <= 1;
                s_PtatOut <= 0;
                s_Rdiscon_N <= 1;
            end else begin
                syState <= TEMPSENS;
            end
        end


        else begin
            syState <= BGSETUP;
            state <= PRECHARGE;
        end
    end
end


// Lag en alwaysblock som teller clk cycles på tmpPulse

always @(negedge clk or snk_ctrl) begin
    if (clk) begin
        snk <= 1;
    end else begin
        snk <= 0;
    end
end

always @(negedge clk or src_ctrl) begin
    if (clk) begin
        src_n <= 1;
    end else begin
        src_n <= 0;
    end
end


endmodule
