module top_module (
    input clk,
    input reset,            
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk)begin
        if(reset)
        q<=8'b0;
        else
        q[7:0]<=d[7:0];
        end
endmodule
