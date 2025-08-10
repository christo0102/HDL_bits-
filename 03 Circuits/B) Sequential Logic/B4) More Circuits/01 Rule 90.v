module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    reg [511:0] q_next;
    assign q_next[0]=q[1]^1'b0;
    assign q_next[511]=q[510]^1'b0;
    genvar i;
    generate
        for(i=1;i<511;i++)begin: gen_block
            assign q_next[i] = q[i-1]^q[i+1];
        end
    endgenerate
    always @(posedge clk)begin
        if(load)
            q<=data;
        else
            q<=q_next;
    end
endmodule
