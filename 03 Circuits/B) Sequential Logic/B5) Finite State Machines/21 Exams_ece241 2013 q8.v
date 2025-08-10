module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output  z 
); 
parameter A=2'b00,B=2'b01,C=2'b10;
    reg [1:0]state,next_state;
    always @(posedge clk or negedge aresetn)begin
        if(~aresetn)
            state <= A;
        else
            state<=next_state;
    end
    always @(*)begin
        case(state)
            A:begin
                if(x==1)
                    next_state=B;
                else
                    next_state=A;
            end
            B:begin
                if(x==0)
                    next_state=C;
                else
                    next_state=B;
            end
            C:begin
                if(x==1)
                    next_state=B;
                else
                    next_state=A;
            end
        endcase
    end
    assign  z= (state == C) && x ;

endmodule
