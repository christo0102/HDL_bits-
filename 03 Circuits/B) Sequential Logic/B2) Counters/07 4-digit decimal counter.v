module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    reg en;
    assign en = 1'b1;
    assign ena[1]=(q[3:0] ==4'b1001);
    assign ena[2]=(q[3:0] ==4'b1001 & q[7:4] ==4'b1001);
    assign ena[3] =(q[3:0] ==4'b1001 & q[7:4] ==4'b1001 & q[11:8] ==4'b1001);
    decade first(.clk(clk),.enable(en),.reset(reset),.q(q[3:0]));
    decade second(.clk(clk),.enable(ena[1]),.reset(reset),.q(q[7:4]));
    decade third(.clk(clk),.enable(ena[2]),.reset(reset),.q(q[11:8]));
    decade fourth(.clk(clk),.enable(ena[3]),.reset(reset),.q(q[15:12]));
endmodule
module decade (
    input clk,
    input enable,
    input reset,
    output reg [3:0] q  
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0000; 
        else if (enable) begin
            if (q == 4'b1001)
                q <= 4'b0000;  
            else
                q <= q + 1;   
        end
    end
endmodule
