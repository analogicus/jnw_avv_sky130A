`default_nettype none

module cmpDig (
    input wire clk,

    output logic cmp_p1,
    output logic cmp_p2,
    output logic zero,
    output logic sample

    );


parameter   PRECHARGE=0,
            OUTPUT=1;

logic [5:0] count;
logic [5:0] state;




initial begin
    cmp_p1 = 1'b0;
    cmp_p2 = 1'b1;
    sample = 1'b0;
end


always_ff @(posedge clk) begin
    if(count == 3) begin
        count <= 0;
        cmp_p1 <= ~cmp_p1;
        cmp_p2 <= ~cmp_p2;
        sample <= 1'b0;
    end else if(count == 1) begin
        sample <= 1'b1;
        count <= count + 1;
    end
    else begin
        sample <= 1'b0;
        count <= count + 1;
    end
end


// initial begin
//     count = 0;
//     state = PRECHARGE;
// end

// always_ff @(posedge clk) begin
//     case(state)
//         PRECHARGE: begin
//             zero <= 1;
//             count <= count + 1;
//             if(count > 6) begin
//                 count <= 0;
//                 state <= OUTPUT;
//             end
//         end
//         OUTPUT: begin
//             zero <= 0;
//         end
//     endcase
// end
endmodule