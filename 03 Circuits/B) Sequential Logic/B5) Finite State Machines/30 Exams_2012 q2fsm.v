module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;
    reg [2:0]state,next_state;
    always @(*)begin
        case(state)
            A:begin
                if(w==1'b1)
                    next_state<=B;
                else
                    next_state<=A;
            end
            B:begin
                if(w==1'b1)
                    next_state<=C;
                else
                    next_state<=D;
            end
            C:begin
                if(w==1'b1)
                    next_state<=E;
                else
                    next_state<=D;
            end
            D:begin
                if(w==1'b1)
                    next_state<=F;
                else
                    next_state<=A;
            end
            E:begin
                if(w==1'b1)
                    next_state<=E;
                else
                    next_state<=D;
            end
             F:begin
                if(w==1'b1)
                    next_state<=C;
                else
                    next_state<=D;
            end
        endcase
    end
    always @(posedge clk)begin
        if(reset)
            state<=A;
        else
            state <=next_state;
    end
   always @(*) begin
        case (state)
            E: z = 1'b1;
            F: z = 1'b1;
            default: z = 0;
        endcase
    end
endmodule
