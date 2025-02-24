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

always_ff @(posedge clk) begin
    if (rst) begin
        state <= PRECHARGE;
    end
    else begin
        case(state)
            PRECHARGE: begin
                if (count > 10) begin
                    state <= DIODE;
                    afterBlank <= DIODE;
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
                PI2 <= 0;
                PII2 <= 0;
                PII1 <= 0;
                PI1 <= 0;
                PA <= 0;
                snk <= 0;
                src_n <= 0;
                valid <= 0;
                Hcharged <= 0;
                Lcharged <= 0;
            end

            DIODE: begin
                PA <= 0;
                PB <= 0;
                PC <= 0;
                PD <= 0;
                if(count > 1) begin
                    PII2 <= 0;
                    state <= BIGDIODE;
                    count <= 0;
                end else begin
                    count <= count + 1;
                    state <= DIODE;
                    PII2 <= 1;
                    cmp_p1 <= ~cmp_p1;
                    cmp_p2 <= ~cmp_p2;
                end
            end

            BIGDIODE: begin
                PA <= 0;
                PB <= 0;
                PC <= 0;
                PD <= 0;
                if(count > 6 && setupDone == 0) begin
                    PI2 <= 0;
                    state <= DIODE;
                    count <= 0;
                end else if (count > 2 && setupDone > 0) begin
                    if (cmp && !Hcharged) begin
                        PI2 <= 0;
                        state <= HCHARGE;
                    end else if (!cmp && !Lcharged) begin
                        PI2 <= 0;
                        state <= LCHARGE;
                    end else if (cmp) begin
                        PI2 <= 1;
                        src_n <= ~src_n;
                    end else if (!cmp) begin
                        PI2 <= 1;
                        snk <= ~snk;
                    end

                end else begin
                    count <= count + 1;
                    state <= BIGDIODE;
                    PI2 <= 1;
                    if (cmp) begin
                        src_n <= ~src_n;	
                    end else if (!cmp) begin
                        if (setupDone == 0) begin
                            setupCount <= setupCount + 1;
                            if (setupCount == 5) begin
                                setupDone <= 1;
                                setupBias <= 0;
                            end
                        end
                        snk <= ~snk;
                    end
                end
            end

            HCHARGE: begin
                PA <= 1;
                PB <= 1;
                if (Lcharged == 1) begin
                    state <= OUTPUT;
                end else begin
                    Hcharged <= 1;
                    state <= BIGDIODE;
                end
            end

            LCHARGE: begin
                PA <= 1;
                PC <= 1;
                if (Hcharged == 1) begin
                    state <= OUTPUT;
                end else begin
                    Lcharged <= 1;
                    state <= BIGDIODE;
                end
            end

            OUTPUT: begin
                count <= 0;
                if (setupDone < 63) begin
                    setupDone <= setupDone + 1;
                    PA <= 1;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    state <= OUTPUT;
                end else begin
                    PA <= 0;
                    PB <= 1;
                    PC <= 1;
                    PD <= 1;
                    state <= DIODE;
                end
                Lcharged <= 0;
                Hcharged <= 0;
            end

        endcase
    end
end

endmodule