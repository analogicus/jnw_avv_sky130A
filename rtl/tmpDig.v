`default_nettype none

module tmpDig (
    input wire clk,
    input wire reset,
    input wire cmp,

    output logic PI1,
    output logic PI2,
    output logic PII1,
    output logic PII2,

    output logic PA,
    output logic PB,
    output logic PC,
    output logic PD,

    output logic src,
    output logic snk,

    output logic rst,
    output logic valid
    );


parameter   PRECHARGE=0,
            DIODE=1,
            BIGDIODE=2,
            HCHARGE=3,
            LCHARGE=4,
            OUTPUT=;

logic [3:0] state;

always_ff @(posedge clk or posedge reset) begin
    PI1 <= 1;
    PI2 <= 1;
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end

always_ff @(cmp) begin
    if (cmp == 1) begin
        src <= 0;
        snk <= 0;
    end
    else begin
        src <= 1;
        snk <= 1;
    end
end


endmodule