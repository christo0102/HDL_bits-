module top_module (
    input clk,
    input w, R, E, L,
    output Q
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
