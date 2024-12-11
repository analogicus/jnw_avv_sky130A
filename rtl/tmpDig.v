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
logic [4:0] setupDone;

always_ff @(posedge clk or posedge reset) begin
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end

initial begin
    state = PRECHARGE;
end



// Exclude averaging caps:
// always_ff @(posedge clk) begin
//     if (rst) begin
//         state <= PRECHARGE;
//     end
//     else begin
//         case(state)
//             PRECHARGE: begin
//                 preChrg <= 1;
//                 count <= 0;
//                 PII1 <= 0;
//                 PII2 <= 0;
//                 PI1 <= 0;
//                 PI2 <= 0;
//                 PA <= 1;
//                 PB <= 1;
//                 PC <= 1;
//                 PD <= 1;
//                 snk <= 0;
//                 src_n <= 0;
//                 valid <= 0;
//                 Hcharged <= 0;
//                 Lcharged <= 0;
//                 state <= BLANKDIODE;
//                 afterBlank <= DIODE;
//             end

//             BLANKDIODE: begin
//                 preChrg <= 0;
//                 count <= 0;
//                 PA <= 0;
//                 PB <= 0;
//                 PC <= 0;
//                 PD <= 0;
//                 if (afterBlank == DIODE) begin
//                     PII1 <= 1;
//                 end else begin
//                     PII1 <= 0;
//                 end
//                 state <= afterBlank;
//                 if (afterBlank == BLANKBIGDIODE) begin
//                     afterBlank <= BIGDIODE;
//                 end
//             end

//             DIODE: begin
//                 if(count > 0) begin
//                     PII2 <= 0;
//                     state <= BLANKDIODE;
//                     afterBlank <= BLANKBIGDIODE;
//                 end else begin
//                     count <= count + 1;
//                     state <= DIODE;
//                     PII2 <= 1;
//                 end
//             end

//             BLANKBIGDIODE: begin
//                 count <= 0;
//                 PA <= 0;
//                 PB <= 0;
//                 PC <= 0;
//                 PD <= 0;
//                 if (afterBlank == BIGDIODE) begin
//                     PI1 <= 1;
//                 end else begin
//                     PI1 <= 0;
//                 end
//                 state <= afterBlank;
//                 if (afterBlank == BLANKDIODE) begin
//                     afterBlank <= DIODE;
//                 end
//             end

//             BIGDIODE: begin
//                 if(count > 1 && setupDone == 0) begin
//                     PI2 <= 0;
//                     state <= BLANKBIGDIODE;
//                     afterBlank <= BLANKDIODE;
//                 end else if (count > 1 && setupDone > 0) begin 
//                         PI2 <= 0;
//                         state <= BLANKBIGDIODE;
//                         afterBlank <= OUTPUT;
//                 end else begin
//                     count <= count + 1;
//                     state <= BIGDIODE;
//                     PI2 <= 1;
//                     if (cmp) begin
//                         src_n <= ~src_n;
//                     end else if (!cmp) begin
//                         if (setupDone == 0) begin
//                             setupCount <= setupCount + 1;
//                             if (setupCount == 5) begin
//                                 setupDone <= 1;
//                             end
//                         end
//                         snk <= ~snk;
//                     end
//                 end
//             end

//             HCHARGE: begin
//                 PA <= 1;
//                 PB <= 1;
//                 if (Lcharged == 1) begin
//                     state <= OUTPUT;
//                 end else begin
//                     Hcharged <= 1;
//                     state <= BLANKBIGDIODE;
//                     afterBlank <= BIGDIODE;
//                 end
//             end

//             LCHARGE: begin
//                 PA <= 1;
//                 PC <= 1;
//                 if (Hcharged == 1) begin
//                     state <= OUTPUT;
//                 end else begin
//                     Lcharged <= 1;
//                     state <= BLANKBIGDIODE;
//                     afterBlank <= BIGDIODE;
//                 end
//             end

//             OUTPUT: begin
//                 if (setupDone < 31) begin
//                     setupDone <= setupDone + 1;
//                     PA <= 1;
//                     state <= OUTPUT;
//                 end else begin
//                     PA <= 1;
//                     state <= BLANKDIODE;
//                     afterBlank <= DIODE;
//                 end
//                 // PB <= 1;
//                 // PC <= 1;
//                 PD <= 1;
//                 Lcharged <= 0;
//                 Hcharged <= 0;
//             end

//         endcase
//     end
// end


// Add intermediate state
// always_ff @(posedge clk) begin
//     if (rst) begin
//         state <= PRECHARGE;
//     end
//     else begin
//         case(state)

//             INTERMEDIATE: begin
//                 preChrg <= 0;
//                 count <= 0;
//                 PII1 <= 0;
//                 PII2 <= 0;
//                 PI1 <= 0;
//                 PI2 <= 0;
//                 PA <= 0;
//                 PB <= 0;
//                 PC <= 0;
//                 PD <= 0;
//                 state <= afterBlank;
//                 if (afterBlank == BLANKBIGDIODE) begin
//                     afterBlank <= BIGDIODE;
//                 end else if (afterBlank == BLANKDIODE) begin
//                     afterBlank <= DIODE;
//                 end
//             end


//             PRECHARGE: begin
//                 preChrg <= 1;
//                 count <= 0;
//                 PII1 <= 0;
//                 PII2 <= 0;
//                 PI1 <= 0;
//                 PI2 <= 0;
//                 PA <= 1;
//                 PB <= 1;
//                 PC <= 1;
//                 PD <= 1;
//                 snk <= 0;
//                 src_n <= 0;
//                 valid <= 0;
//                 Hcharged <= 0;
//                 Lcharged <= 0;
//                 state <= BLANKDIODE;
//                 afterBlank <= DIODE;
//             end

//             BLANKDIODE: begin
//                 preChrg <= 0;
//                 count <= 0;
//                 PA <= 0;
//                 PB <= 0;
//                 PC <= 0;
//                 PD <= 0;
//                 if (afterBlank == DIODE) begin
//                     PII1 <= 1;
//                 end else begin
//                     PII1 <= 0;
//                 end
//                 state <= afterBlank;
//                 if (afterBlank == BLANKBIGDIODE) begin
//                     afterBlank <= BIGDIODE;
//                 end
//             end



//             // Setter setuptid til 15 sykluser på vn.

//             DIODE: begin
//                 if(count > 0) begin
//                     PII2 <= 0;
//                     state <= BLANKDIODE;
//                     afterBlank <= BLANKBIGDIODE;
//                 end else begin
//                     count <= count + 1;
//                     state <= DIODE;
//                     PII2 <= 1;
//                 end
//             end

//             BLANKBIGDIODE: begin
//                 count <= 0;
//                 PA <= 0;
//                 PB <= 0;
//                 PC <= 0;
//                 PD <= 0;
//                 if (afterBlank == BIGDIODE) begin
//                     PI1 <= 1;
//                 end else begin
//                     PI1 <= 0;
//                 end
//                 state <= afterBlank;
//                 if (afterBlank == BLANKDIODE) begin
//                     afterBlank <= DIODE;
//                 end
//             end

//             BIGDIODE: begin
//                 if(count > 1 && setupDone == 0) begin
//                     PI2 <= 0;
//                     state <= BLANKBIGDIODE;
//                     afterBlank <= BLANKDIODE;
//                 end else if (count > 1 && setupDone > 0) begin
//                     if (cmp) begin
//                         PI2 <= 0;
//                         state <= BLANKBIGDIODE;
//                         afterBlank <= HCHARGE;
//                     end else if (!cmp) begin
//                         PI2 <= 0;
//                         state <= BLANKBIGDIODE;
//                         afterBlank <= LCHARGE;
//                     end 

//                 end else begin
//                     count <= count + 1;
//                     state <= BIGDIODE;
//                     PI2 <= 1;
//                     if (cmp) begin
//                         src_n <= ~src_n;
//                     end else if (!cmp) begin
//                         if (setupDone == 0) begin
//                             setupCount <= setupCount + 1;
//                             if (setupCount == 5) begin
//                                 setupDone <= 1;
//                             end
//                         end
//                         snk <= ~snk;
//                     end
//                 end
//             end

//             HCHARGE: begin
//                 PA <= 1;
//                 PB <= 1;
//                 if (Lcharged == 1) begin
//                     state <= INTERMEDIATE;
//                     afterBlank <= OUTPUT;
//                 end else begin
//                     Hcharged <= 1;
//                     state <= INTERMEDIATE;
//                     afterBlank <= BLANKBIGDIODE;
//                 end
//             end

//             LCHARGE: begin
//                 PA <= 1;
//                 PC <= 1;
//                 if (Hcharged == 1) begin
//                     state <= INTERMEDIATE;
//                     afterBlank <= OUTPUT;
//                 end else begin
//                     Lcharged <= 1;
//                     state <= INTERMEDIATE;
//                     afterBlank <= BLANKBIGDIODE;
//                 end
//             end

//             OUTPUT: begin
//                 if (setupDone < 31) begin
//                     setupDone <= setupDone + 1;
//                     PA <= 1;
//                     state <= OUTPUT;
//                 end else begin
//                     PA <= 0;
//                     state <= INTERMEDIATE;
//                     afterBlank <= BLANKDIODE;
//                 end
//                 PB <= 1;
//                 PC <= 1;
//                 PD <= 1;
//                 Lcharged <= 0;
//                 Hcharged <= 0;
//             end

//         endcase
//     end
// end



always_ff @(posedge clk) begin
    if (rst) begin
        state <= PRECHARGE;
    end
    else begin
        case(state)
            PRECHARGE: begin
                if (count > 10) begin
                    state <= BLANKDIODE;
                    afterBlank <= DIODE;
                    count <= 0;
                    preChrg <= 0;
                end
                else begin
                    count <= count + 1;
                end
                preChrg <= 1;
                setupBias <= 1;
                PII1 <= 0;
                PII2 <= 0;
                PI1 <= 0;
                PI2 <= 0;
                PA <= 0;
                PB <= 0;
                PC <= 0;
                PD <= 0;
                snk <= 0;
                src_n <= 0;
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



            // Setter setuptid til 15 sykluser på vn.

            DIODE: begin
                if(count > 0) begin
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
                count <= 0;
                PA <= 0;
                PB <= 0;
                PC <= 0;
                PD <= 0;
                snk <= 0;
                src_n <= 0;
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
                if(count > 4 && setupDone == 0) begin
                    PI2 <= 0;
                    state <= BLANKBIGDIODE;
                    afterBlank <= BLANKDIODE;
                end else if (count > 4 && setupDone > 0) begin
                     if (cmp && !Hcharged) begin
                        PI2 <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= HCHARGE;
                    end else if (!cmp && !Lcharged) begin
                        PI2 <= 0;
                        state <= BLANKBIGDIODE;
                        afterBlank <= LCHARGE;
                    end else if (cmp) begin
                        src_n <= ~src_n;
                    end else if (!cmp) begin
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
                if (setupDone < 31) begin
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