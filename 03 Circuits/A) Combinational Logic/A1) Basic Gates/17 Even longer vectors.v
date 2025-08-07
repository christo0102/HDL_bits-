module top_module( 
    input [99:0] in,
    output reg [98:0] out_both,
    output [99:1] out_any,
    output reg [99:0] out_different );
    assign out_both = in[98:0]&in[99:1];
    assign out_any = in[98:0] | in[99:1];
    assign out_different[98:0] =in[98:0] ^ in[99:1];
    assign out_different[99]=in[99]^in[0];
endmodule
