module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    reg [3:0]store;
    always @(posedge clk)begin
        if(reset)
            q<=4'b0;
        else
            q<=q+1;
    end
endmodule
