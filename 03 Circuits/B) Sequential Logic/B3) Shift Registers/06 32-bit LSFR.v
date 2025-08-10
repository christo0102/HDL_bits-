module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    reg [31:0] q_out;
    always @(*)begin
        q_out = q[31:1];
        q_out[31]=q[0];
        q_out[21]=q[22]^q[0];
        q_out[1]=q[2]^q[0];
        q_out[0]=q[1]^q[0];
    end
    always @(posedge clk)begin
        if(reset)
            q<=32'b1;
        else
        q<=q_out;
    end
endmodule
