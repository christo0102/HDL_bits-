module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    wire q1,q2,q3;
    flipflop first(.clk(clk),.d(in),.resetn(resetn),.q(q1));
    flipflop second(.clk(clk),.d(q1),.resetn(resetn),.q(q2));
    flipflop third(.clk(clk),.d(q2),.resetn(resetn),.q(q3));
    flipflop fourth(.clk(clk),.d(q3),.resetn(resetn),.q(out));
endmodule
module flipflop(input clk,d,resetn,output q);
    always @(posedge clk)begin
        if(~resetn)
            q<=1'b0;
        else 
        q<=d;
    end
endmodule
