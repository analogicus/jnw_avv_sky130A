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

    output logic src_n,
    output logic snk,

    output logic cmp_p1,
    output logic cmp_p2,
    output logic sample,

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
            INTERMEDIATE=8;

logic [3:0] state;
logic [3:0] afterBlank;
logic [5:0] count;
logic [5:0] chcount;
logic [5:0] setupCount;
logic       Hcharged;
logic       Lcharged;
logic [5:0] setupDone;
logic       snk_ctrl;
logic       src_ctrl;
logic       intCmp;
logic       firstCycle;




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
    snk_ctrl = 1'b0;
    src_ctrl = 1'b0;
    PI1 = 1;
end

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


always_ff @(posedge clk) begin
    if (rst) begin
        state <= PRECHARGE;
    end
    else begin
        case(state)
            BIGDIODE: begin
                PI2 <= 1;
                count <= count + 1;
                if (setupDone == 0) begin
                    if (count > 7) begin
                        PI2 <= 0;
                        count <= 0;
                        state <= DIODE;
                    end else if (count < 5) begin                 
                        if (cmp) begin
                            src_ctrl <= ~src_ctrl;	
                        end else begin
                            if (setupDone == 0) begin
                                setupCount <= setupCount + 1;
                                if (setupCount == 6) begin
                                    setupDone <= 1;
                                    setupBias <= 0;
                                end
                            end
                            snk_ctrl <= ~snk_ctrl;
                        end
                    end
                end else if (count == 0) begin
                    if (intCmp) begin
                        src_ctrl <= ~src_ctrl;
                    end else begin
                        snk_ctrl <= ~snk_ctrl;
                    end
                end else if (count > 15) begin
                    PI2 <= 0;
                    count <= 0;
                    state <= DIODE;
                end else begin
                    state <= BIGDIODE;
                end
                PA <= 0;
                PB <= 0;
                PC <= 0;
                PD <= 0;
            end

            DIODE: begin
                PII2 <= 1;
                count <= count + 1;
                if(count > 7) begin
                    PII2 <= 0;
                    count <= 0;
                    if (setupDone > 0) begin
                        if (setupDone == 1) begin
                            state <= OUTPUT;
                        end else if (!Hcharged) begin
                            state <= HCHARGE;
                        end else begin
                            state <= LCHARGE;
                        end
                    end else begin
                        state <= BIGDIODE;
                    end
                end else if (count == 0) begin
                    cmp_p1 <= ~cmp_p1;
                    cmp_p2 <= ~cmp_p2;
                end else

                PA <= 0;
                PB <= 0;
                PC <= 0;
                PD <= 0;
            end


            PRECHARGE: begin
                if (count > 20) begin
                    state <= BIGDIODE;
                    count <= 0;
                    preChrg <= 0;
                    PB <= 0;
                    PC <= 0;
                    PD <= 0;
                end
                else begin
                    count <= count + 1;
                    preChrg <= 1;
                    setupBias <= 1;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                end
                firstCycle <= 1;
                PI2 <= 0;
                PII2 <= 0;
                PII1 <= 0;
                PI1 <= 0;
                PA <= 0;
                valid <= 0;
                Hcharged <= 0;
                Lcharged <= 0;
                cmp_p1 <= 0;
                cmp_p2 <= 1;
            end

            HCHARGE: begin
                count <= count + 1;
                PA <= 1;
                PB <= 1;
                if (count > 4) begin
                    count <= 0;
                    intCmp <= cmp;
                    if (Lcharged == 1) begin
                        state <= OUTPUT;
                    end else begin
                        Hcharged <= 1;
                        state <= BIGDIODE;
                    end
                end
            end

            LCHARGE: begin
                PA <= 1;
                PC <= 1;
                count <= count + 1;
                if (count > 4) begin
                    intCmp <= cmp;
                    count <= 0;
                    if (Hcharged == 1) begin
                        state <= OUTPUT;
                    end else begin
                        Lcharged <= 1;
                        state <= BIGDIODE;
                    end
                end
            end

            OUTPUT: begin
                if (setupDone < 15) begin
                    setupDone <= setupDone + 1;
                    PA <= 1;
                    state <= OUTPUT;
                end else begin
                    PA <= 0;
                    state <= BIGDIODE;
                end
                count <= 0;
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