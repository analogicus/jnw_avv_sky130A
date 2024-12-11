`default_nettype none

module chargePump (
    input wire clk,
    input wire reset,

    output logic src_n,
    output logic snk,

    output logic rst,
    output logic preChrg
    );


parameter   SNK = 0,
            SRC = 1,
            PRECHARGE= 2;


logic [3:0] state;
logic [5:0] count;


always_ff @(posedge clk or posedge reset) begin
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end

initial begin
    state = PRECHARGE;
end

always_ff @(posedge clk or posedge reset) begin
    if(reset) begin
        state <= PRECHARGE;
    end else
        case(state)
            PRECHARGE: begin
                preChrg <= 1;
                snk <= 0;
                src_n <= 0;
                if (count > 10) begin
                    state <= SNK;
                    count <= 0;
                    preChrg <= 0;
                end
                else begin
                    count <= count + 1;
                end
            end
            SNK: begin
                src_n <= 0;
                snk <= ~snk;
                if (count > 5) begin
                    state <= SRC;
                    count <= 0;
                end
                else begin
                    count <= count + 1;
                end
            end
            SRC: begin
                snk <= 0;
                src_n <= ~src_n;
                if (count > 5) begin
                    state <= SNK;
                    count <= 0;
                end
                else begin
                    count <= count + 1;
                end
            end
        endcase
    end
endmodule