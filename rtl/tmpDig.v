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
    if(chcount > 1) begin
        chcount <= 0;
        cmp_p1 <= ~cmp_p1;
        cmp_p2 <= ~cmp_p2;
        sample <= 1'b0;
    end else if(chcount > 0) begin
        sample <= 1'b1;
        chcount <= chcount + 1;
    end
    else begin
        sample <= 1'b0;
        chcount <= chcount + 1;
    end
end





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
                    preChrg <= 1;
                    setupBias <= 1;
                end
                PI2 <= 0;
                PII2 <= 0;
                PII1 <= 0;
                PI1 <= 0;
                PA <= 0;
                PB <= 1;
                PC <= 1;
                PD <= 1;
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
                    // cmp_p1 <= ~cmp_p1;
                    // cmp_p2 <= ~cmp_p2;
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
                if (setupDone < 63) begin
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