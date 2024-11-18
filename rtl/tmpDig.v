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

    output logic rst,
    output logic valid,
    output logic preChrg
    );


parameter   PRECHARGE=0,
            DIODE=1,
            BIGDIODE=2,
            HCHARGE=3,
            LCHARGE=4,
            OUTPUT=5,
            BLANKDIODE=6,
            BLANKBIGDIODE=7;

logic [2:0] state;
logic [2:0] afterBlank;
logic [5:0] count;
logic [5:0] setupCount;
logic       cmpEvent;
logic       outNxt;
logic       Hnxt;
logic       prevCmp;
logic       setupDone;

always_ff @(posedge clk or posedge reset) begin
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= PRECHARGE;
    end
    else begin
        case(state)
            PRECHARGE: begin
                preChrg <= 1;
                count <= 0;
                PII1 <= 0;
                PII2 <= 0;
                PI1 <= 0;
                PI2 <= 0;
                PA <= 0;
                PB <= 0;
                PC <= 0;
                PD <= 0;
                snk <= 0;
                src_n <= 1;
                valid <= 0;
                outNxt <= 0;
                Hnxt <= 1;
                state <= BLANKDIODE;
                afterBlank <= DIODE;
            end

            BLANKDIODE: begin
                preChrg <= 0;
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
                    count <= 0;
                    PII2 <= 0;
                    state <= BLANKDIODE;
                    afterBlank <= BLANKBIGDIODE;
                end else begin
                    count <= count + 1;
                    state <= DIODE;
                    PII2 <= 1;
                end
            end

            BLANKBIGDIODE: begin
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
                if(count > 0) begin
                    count <= 0;
                    PI2 <= 0;
                    state <= BLANKBIGDIODE;
                    afterBlank <= BLANKDIODE;
                    src_n <= 1;
                    snk <= 0;
                end else if (count < 3) begin
                    count <= count + 1;
                    state <= BIGDIODE;
                    PI2 <= 1;
                    if (cmp) begin
                        src_n <= ~src_n;
                        snk <= 0;
                    end else begin
                        src_n <= 1;
                        snk <= ~snk;
                    end
                end
                else begin
                    count <= count + 1;
                end
            end
        endcase
    end
end

initial begin
    state = PRECHARGE;
end

endmodule