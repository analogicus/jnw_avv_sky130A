`default_nettype none

module cmpDig (
    input wire clk,

    output logic cmp_p1,
    output logic cmp_p2
    );


initial begin
    cmp_p1 = 1'b0;
    cmp_p2 = 1'b1;
end


always_ff @(posedge clk) begin
    cmp_p1 <= ~cmp_p1;
    cmp_p2 <= ~cmp_p2;
end

endmodule