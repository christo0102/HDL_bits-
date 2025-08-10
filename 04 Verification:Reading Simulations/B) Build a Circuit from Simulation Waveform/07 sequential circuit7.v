module top_module (
    input clk,
    input a,
    output q );
    always @(posedge clk)begin
        if(a==1)
            q<=1'b0;
        else
            q<=1'b1;
    end
endmodule
