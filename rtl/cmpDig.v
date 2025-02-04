`default_nettype none

module cmpDig (
    input wire clk,

    output logic cmp_p1,
    output logic cmp_p2,
    output logic sample
    );


logic [3:0] count;

initial begin
    cmp_p1 = 1'b0;
    cmp_p2 = 1'b1;
end


always_ff @(posedge clk) begin
    if(count > 1) begin
        count <= 0;
        cmp_p1 <= ~cmp_p1;
        cmp_p2 <= ~cmp_p2;
        sample <= 1'b0;
    end else if(count > 0) begin
        sample <= 1'b1;
    end
    else begin
        count <= count + 1;
    end
end

endmodule