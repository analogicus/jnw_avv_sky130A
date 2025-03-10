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

    output logic src,
    output logic snk,

    output logic cmp_p1,
    output logic cmp_p2,
    output logic sample,

    output logic rst,
    output logic valid,
    output logic preChrg,
    output logic setupBias
    );


parameter   PRECHARGE=2,
            DIODE=1,
            BIGDIODE=0,
            HCHARGE=3,
            LCHARGE=4,
            OUTPUT=5,
            BLANKDIODE=6,
            BLANKBIGDIODE=7,
            PUMPENABLE=8;


logic [3:0] state;
logic [3:0] afterBlank;
logic [5:0] count;
logic [5:0] chcount;
logic [5:0] setupCount;
logic       Hcharged;
logic       Lcharged;
logic [5:0] setupDone;
logic       snk_fb;
logic       src_fb;
logic       snk_ctrl;
logic       src_ctrl;

always_ff @(posedge clk or posedge reset) begin
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end

initial begin
    state = PRECHARGE;
    cmp_p1 = 1'b0;
    cmp_p2 = 1'b1;
end

always @(cmp or snk_ctrl or afterBlank) begin
    if (afterBlank == PUMPENABLE) begin
        if (cmp | !snk_ctrl) begin
            snk <= 0;
            // snk_fb <= 1;
        end else if (snk_ctrl && !cmp) begin
            snk <= 1;
            // snk_fb <= 0;
        end else begin
            snk <= 0;
            // snk_fb <= 0;
        end
    end else begin
        snk <= 0;
    end
end

always @(cmp or src_ctrl or afterBlank) begin
    if (afterBlank == PUMPENABLE) begin
        if (!cmp | !src_ctrl) begin
            src <= 0;
            // src_fb <= 1;
        end else if (src_ctrl && cmp) begin
            src <= 1;
            // src_fb <= 0;
        end else begin
            src <= 0;
            // src_fb <= 0;
        end
    end else begin
        src <= 0;
    end
end


always_ff @(posedge clk) begin
    if (rst) begin
        state <= PRECHARGE;
    end
    else begin
        case(state)

            BIGDIODE: begin
                if(count > 6 && setupDone == 0) begin                 // kanskje lengre count for precharge
                    PI2 <= 0;
                    state <= BLANKBIGDIODE;
                    afterBlank <= BLANKDIODE;
                    src_ctrl <= 0;
                    snk_ctrl <= 0;    
                end else if (count > 2 && setupDone > 0) begin           // må kanskje sette denne utenfor if count > 2
                    if (cmp && !Hcharged) begin                            // må sjekke om disse lades riktig
                        PI2 <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= HCHARGE;
                    end else if (!cmp && !Lcharged) begin                   // må sjekke om disse lades riktig
                        PI2 <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= LCHARGE;
                    end else if (cmp) begin
                        // afterBlank <= PUMPENABLE;
                        src_ctrl <= 1;
                        snk_ctrl <= 0;
                    end else if (!cmp) begin
                        // afterBlank <= PUMPENABLE;
                        snk_ctrl <= 1;
                        src_ctrl <= 0;
                    end
                end else begin
                    afterBlank <= PUMPENABLE;
                    count <= count + 1;
                    state <= BIGDIODE;
                    PI2 <= 1;
                    if (cmp) begin
                        src_ctrl <= 1;
                        snk_ctrl <= 0;	
                    end else if (!cmp) begin
                        if (setupDone == 0) begin
                            setupCount <= setupCount + 1;
                            if (setupCount == 4) begin     // Er noe funky når setupcount er oddetall
                                setupDone <= 1;
                                setupBias <= 0;
                            end
                        end
                        snk_ctrl <= 1;
                        src_ctrl <= 0;
                    end
                end
            end

            PRECHARGE: begin
                if (count > 10) begin
                    state <= BLANKDIODE;
                    afterBlank <= DIODE;
                    count <= 0;
                    preChrg <= 0;
                end
                else begin
                    count <= count + 1;
                    preChrg <= 1;
                end
                setupBias <= 0;
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
                if(count > 0) begin
                    PII2 <= 0;
                    state <= BLANKDIODE;
                    afterBlank <= BLANKBIGDIODE;
                end else begin
                    count <= count + 1;
                    state <= DIODE;
                    PII2 <= 1;
                    cmp_p1 <= ~cmp_p1;
                    cmp_p2 <= ~cmp_p2;
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

            HCHARGE: begin
                PA <= 1;
                PB <= 1;
                if (Lcharged == 1) begin
                    state <= OUTPUT;
                end else begin
                    Hcharged <= 1;
                    state <= BLANKBIGDIODE;
                    afterBlank <= BIGDIODE;
                end
            end

            LCHARGE: begin
                PA <= 1;
                PC <= 1;
                if (Hcharged == 1) begin
                    state <= OUTPUT;
                end else begin
                    Lcharged <= 1;
                    state <= BLANKBIGDIODE;
                    afterBlank <= BIGDIODE;
                end
            end

            OUTPUT: begin
                if (setupDone < 63) begin
                    setupDone <= setupDone + 1;
                    PA <= 1;
                    state <= OUTPUT;
                end else begin
                    PA <= 0;
                    state <= BLANKDIODE;
                    afterBlank <= DIODE;
                end
                PB <= 1;
                PC <= 1;
                PD <= 1;
                Lcharged <= 0;
                Hcharged <= 0;
            end

        endcase
    end
end

endmodule