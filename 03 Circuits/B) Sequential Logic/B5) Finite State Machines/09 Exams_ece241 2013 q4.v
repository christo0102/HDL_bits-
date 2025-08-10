module top_module(
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
);
    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
    reg [1:0] state, next_state;
initial begin
    dfr = 1;
end

    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            dfr <= 1'b1;
        end else begin
            state<=next_state;
            if      (state==C && next_state==B) dfr <= 1;
            else if (state==B && next_state==C) dfr <= 0;
            else if (state==A && next_state==B) dfr <= 0;
            else if (state==D && next_state==C) dfr <= 1;
            else if (state==C && next_state==D) dfr <= 0;
            else if (next_state == A)dfr <= 1; 
        end
    end

    always @(*) begin
        casez (s)
            3'b000: next_state = A;
            3'b001: next_state = B;
            3'b011: next_state = C;
            3'b111: next_state = D;
            default: next_state = A;
        endcase
    end

    always @(*) begin
        fr1 = 0; fr2 = 0; fr3 = 0;
        case (state)
            A: begin fr1 = 1; fr2 = 1; fr3 = 1; end
            B: begin fr1 = 1; fr2 = 1; fr3 = 0; end
            C: begin fr1 = 1; fr2 = 0; fr3 = 0; end
            D: begin fr1 = 0; fr2 = 0; fr3 = 0; end
        endcase
    end
endmodule
