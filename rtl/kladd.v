`default_nettype none

module tmpDig (
    input wire clk,
    input wire reset,
    input wire cmp,

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
            BLANKBIGDIODE=7,
            INTERMEDIATE=8,
            SMPLCMP=9,
            BANDGAP=10;


logic [3:0] state;
logic [3:0] afterBlank;
logic [5:0] count;
logic [5:0] setupCount;
logic [5:0] syState;
logic       Hcharged;
logic       Lcharged;
logic [6:0] setupDone;
logic       snk_ctrl;
logic       src_ctrl;
logic       intermCmp;
logic [2:0] cmpCount;


always_ff @(posedge clk or posedge reset) begin
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end

initial begin
    syState = PRECHARGE;
    state = PRECHARGE;
    cmpCount = 0;
    cmp_p1 = 1'b1;
    cmp_p2 = 1'b0;
    snk_ctrl = 1'b0;
    src_ctrl = 1'b0;
end


always_ff @(posedge clk) begin
    if (rst) begin
        state <= PRECHARGE;
    end
    else begin

//////////////// BANDGAP /////////////////

        if (syState == BANDGAP) begin
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
                        intermCmp <= cmp;
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
                    PI2  <= 1;
                    if (cmp == intermCmp ) begin
                        if (cmp) begin
                            src_n <= 1;
                            snk <= 0;
                        end else begin
                            src_n <= 0;
                            snk <= 1;
                            if (setupDone == 0) begin
                                setupCount <= setupCount + 1;
                                if (setupCount == 2) begin
                                    afterBlank <= OUTPUT;
                                    state <= BLANKDIODE;
                                    PI2 <= 0;
                                    setupCount <= 0;
                                end
                            end 
                        end
                    end else if (count > 5) begin
                        count <= 0;
                        PI2  <= 0;
                        snk <= 0;
                        src_n <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= BLANKDIODE;
                    end else begin
                        count <= count + 1;
                    end
                end

                HCHARGE: begin
                    count <= count + 1;
                    PA <= 1;
                    PB <= 1;
                    s_BG2CMP <= 1;
                    if (count > 4) begin
                        intermCmp <= cmp;
                        count <= 0;
                        // s_BG2CMP <= 0;
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
                        // s_BG2CMP <= 0;
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
                    if (setupDone < 14) begin
                        setupDone <= setupDone + 1;
                        PA <= 1;
                        state <= OUTPUT;
                    end else begin
                        PA <= 0;
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
                    if(count > 5) begin
                        state <= BLANKDIODE;
                        afterBlank <= BLANKBIGDIODE;
                        PII2  <= 0;
                    end else begin
                        state <= DIODE;
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
                        syState <= BANDGAP;
                        state <= BLANKBIGDIODE;
                        afterBlank <= BIGDIODE;
                    end
                end

                BIGDIODE: begin
                    count <= count + 1;
                    PI2 <= 1;
                    if (count > 14) begin
                        count <= 0;
                        syState <= BANDGAP;
                        intermCmp <= cmp;
                    end else begin
                        state <= BIGDIODE;
                    end
                end
            endcase 
        end 
    end
end



endmodule