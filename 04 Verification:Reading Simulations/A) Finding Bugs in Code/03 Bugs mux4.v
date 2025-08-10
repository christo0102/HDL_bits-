module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0]out1, out2;
    mux2 mux0 (.a(a),.b(b),.sel(sel[0]),.out(out1));
    mux2 mux1 (.a(c),.b(d),.sel(sel[0]),.out(out2));
    mux2 mux3 ( .sel(sel[1]),.a(out1), .b(out2),.out(out) );
endmodule
