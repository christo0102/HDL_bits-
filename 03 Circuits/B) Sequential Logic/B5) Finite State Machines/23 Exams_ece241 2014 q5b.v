module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
parameter A = 1'b0,B=1'b1;
reg state,next_state;
    always @(*)begin
        case(state)
            A: begin
                if(x==1)
                    next_state <=B;
                else
                    next_state<=A;
            end
            B: next_state <=B;
        endcase
    end
    always @(*)begin
        case(state)
            A:z=(x==1);
            B:z=(x==0);
        endcase
        end
    always @(posedge clk,posedge areset)begin
           if(areset)
        state<=A;
       else
        state <=next_state;
       end
endmodule
