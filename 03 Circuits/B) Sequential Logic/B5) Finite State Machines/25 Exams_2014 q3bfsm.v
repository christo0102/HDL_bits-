module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;
    reg [2:0]state,next_state;
    always @(*)begin
        case(state)
            A:begin
                if(x==1'b1)
                    next_state<=B;
                else
                    next_state<=A;
            end
            B:begin
                if(x==1'b1)
                    next_state<=E;
                else
                    next_state<=B;
            end
            C:begin
                if(x==1'b1)
                    next_state<=B;
                else
                    next_state<=C;
            end
            D:begin
                if(x==1'b1)
                    next_state<=C;
                else
                    next_state<=B;
            end
            E:begin
                if(x==1'b1)
                    next_state<=E;
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
    assign z = (state==D ||state==E);
endmodule
