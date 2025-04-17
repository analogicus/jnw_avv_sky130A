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
            INTERMEDIATE=8;

logic [3:0] state;
logic [3:0] afterBlank;
logic [5:0] count;
logic [5:0] setupCount;
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

            BIGDIODE: begin
                count <= count + 1;
                PI2  <= 1;
                if (setupDone == 0) begin
                    if (cmp) begin
                        src_ctrl <= ~src_ctrl;	
                    end else begin
                        if (setupDone == 0) begin
                            setupCount <= setupCount + 1;
                            if (setupCount == 4) begin
                                setupDone <= 1;
                                setupBias <= 0;
                            end
                        end
                        snk_ctrl <= ~snk_ctrl;
                    end
                    if (count > 5) begin
                        PI2  <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= BLANKDIODE;
                    end else begin
                        state <= BIGDIODE;
                    end
                end else if (count == 0) begin
                    if (intermCmp) begin
                        src_ctrl <= ~src_ctrl;
                    end else begin
                        snk_ctrl <= ~snk_ctrl;
                    end
                end else if (count > 10) begin
                    PI2  <= 0;
                    state <= BLANKBIGDIODE;
                    afterBlank <= BLANKDIODE;
                end
            end

            HCHARGE: begin
                count <= count + 1;
                PA <= 1;
                PB <= 1;
                // s_BG2CMP <= 1;
                if (count > 4) begin
                    intermCmp <= cmp;
                    // s_BG2CMP <= 0;
                    count <= 0;
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
                // s_BG2CMP <= 1;
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
                end
                PB <= 1;
                PC <= 1;
                PD <= 1;
                Lcharged <= 0;
                Hcharged <= 0;
            end
            
            
            PRECHARGE: begin
                if (count > 62) begin
                    state <= BLANKBIGDIODE;
                    afterBlank <= BIGDIODE;
                    count <= 0;
                    preChrg <= 0;
                    cmp_p1 <= ~cmp_p1;
                    cmp_p2 <= ~cmp_p2;
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

        endcase
    end
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







// always_ff @(posedge clk) begin
//     if (setupDone > 1) begin
//         if(state != BLANKBIGDIODE) begin
//             cmp_p1 <= ~cmp_p1;
//             cmp_p2 <= ~cmp_p2;
//             cmpCount <= 0;
//         end else begin
//             cmpCount <= cmpCount + 1;
//         end
//     end
// end

            // BLANKBIGDIODE: begin
            //     PA<= 0;
            //     PB <= 0;
            //     PC <= 0;
            //     PD <= 0;
            //     if (afterBlank == BIGDIODE) begin
            //         s_BG2CMP <= 1;
            //         PI1 <= 1;
            //         if (setupDone > 0) begin
            //             if (count > 1) begin
            //                 intermCmp <= cmp;
            //                 s_BG2CMP <= 0;
            //                 state <= afterBlank;
            //                 count <= 0;
            //             end else begin
            //                 count <= count + 1;
            //             end
            //         end else begin
            //             state <= afterBlank;
            //         end
            //     end else begin
            //         PI1 <= 0;
            //         state <= afterBlank;
            //     end
            //     if (afterBlank == BLANKDIODE) begin
            //         afterBlank <= DIODE;
            //     end
            // end


endmodule
