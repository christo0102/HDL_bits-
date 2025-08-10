module top_module (
    input clk,
    input reset,
    output [3:0] q);
    always @(posedge clk)begin
        if(reset)
            q<=4'b0001;
        else
            q<=(q==4'b1010)?4'b001:q+1;
    end
endmodule
