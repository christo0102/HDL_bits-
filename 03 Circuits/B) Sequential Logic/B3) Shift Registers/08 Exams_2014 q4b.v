module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);
    wire [3:0] q;

    MUXDFF d0 (.clk(KEY[0]), .w(KEY[3]), .R(SW[3]), .E(KEY[1]), .L(KEY[2]), .Q(q[3]));
    MUXDFF d1 (.clk(KEY[0]), .w(q[3]),   .R(SW[2]), .E(KEY[1]), .L(KEY[2]), .Q(q[2]));
    MUXDFF d2 (.clk(KEY[0]), .w(q[2]),   .R(SW[1]), .E(KEY[1]), .L(KEY[2]), .Q(q[1]));
    MUXDFF d3 (.clk(KEY[0]), .w(q[1]),   .R(SW[0]), .E(KEY[1]), .L(KEY[2]), .Q(q[0]));

    assign LEDR = q;
endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q
);
    reg g,D;
    always @(posedge clk)begin
        case(E)
            1'b0: g=Q;
            1'b1: g=w;
        endcase
        case(L)
            1'b0:D=g;
            1'b1:D=R;
        endcase
        Q<=D;
    end
endmodule
