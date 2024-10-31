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
            OUTPUT=5;

logic [2:0] state;
logic [5:0] count;
logic       cmpEvent;
logic       outNxt;
logic       Hnxt;
logic       prevCmp;

always_ff @(posedge clk or posedge reset) begin
    if(reset)
        rst <= 1'b1;
    else
        rst <= 1'b0;
end

// Mulig problem med løsning som dette er at det kan bli delay på en
// klokkeperiode fra når FSMen bytter state til når snk og src blir oppdatert
always_ff @(cmp or posedge clk) begin
    if (state == BIGDIODE && cmp != prevCmp) begin
        cmpEvent <= 1;
    end
    else if (state == BIGDIODE) begin
        cmpEvent <= 0;
        if (cmp) begin
            snk <= 1;
            src <= 1;
        end
        else begin
            snk <= 0;
            src <= 0;
        end
    end
    else begin
        cmpEvent <= 0;
        snk <= 0;
        src <= 1;
    end
    prevCmp <= cmp;
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= PRECHARGE;
    end
    else begin
        case(state)
            OUTPUT: begin
                if (count > 3 && cmpEvent) begin
                    count <= 0;
                    PD <= 0;
                    PII1 <= 0;
                    PII2 <= 0;
                    state <= DIODE;
                end
                else begin
                    count <= count + 1;
                    PD <= 1;
                    PII1 <= 1;
                    PII2 <= 1;
                end
            end

            BIGDIODE: begin
                if(cmpEvent) begin
                    PI1 <= 0;
                    PI2 <= 0;
                    if (Hnxt) begin
                        Hnxt <= 0;
                        state <= HCHARGE;
                    end
                    else begin
                        Hnxt <= 1;
                        state <= LCHARGE;
                    end
                end
                else begin
                    PI1 <= 1;
                    PI2 <= 1;
                    state <= BIGDIODE;
                end
            end

            DIODE: begin
                if(count > 3) begin
                    count <= 0;
                    PII1 <= 0;
                    PII2 <= 0;
                    state <= BIGDIODE;
                end
                else begin
                    count <= count + 1;
                    state <= DIODE;
                    PII1 <= 1;
                    PII2 <= 1;
                end
            end

            HCHARGE: begin
                if (count > 3) begin               // Charge the low voltage cap
                    count <= 0;
                    PA <= 0;
                    PB <= 0;
                    if (outNxt) begin               // Decide if we should go to output
                        outNxt <= 0;                // or go back to big diode
                        state <= OUTPUT;
                    end
                    else begin
                        outNxt <= 1;
                        state <= BIGDIODE;
                    end
                end
                else begin
                    count <= count + 1;
                    PA <= 1;
                    PB <= 1;
                end
            end

            LCHARGE: begin
                if (count > 3) begin               // Charge the high voltage cap
                    count <= 0;
                    PA <= 0;
                    PC <= 0;
                    if (outNxt) begin               // Decide if we should output
                        outNxt <= 0;                // or go back to big diode
                        state <= OUTPUT;
                    end
                    else begin
                        outNxt <= 1;
                        state <= BIGDIODE;
                    end
                end
                else begin
                    count <= count + 1;
                    PA <= 1;
                    PC <= 1;
                end
            end

            PRECHARGE: begin
                PII1 <= 0;
                PII2 <= 0;
                PI1 <= 0;
                PI2 <= 0;
                PA <= 0;
                PB <= 0;
                PC <= 0;
                PD <= 0;
                valid <= 0;
                outNxt <= 0;
                Hnxt <= 1;
                state <= DIODE;
            end
        endcase
    end
end

initial begin
    state = PRECHARGE;
    count = 0;
    src = 1;
    snk = 0;
end

endmodule