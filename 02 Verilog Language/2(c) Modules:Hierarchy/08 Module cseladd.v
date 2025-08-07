module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]sum1,sum2,sum3;
    wire cout1;
    add16 first (.a(a[15:0]),.b(b[15:0]),.cin(0),.cout(cout1),.sum(sum1[15:0]));
    add16 second (.a(a[31:16]),.b(b[31:16]),.cin(0),.cout(),.sum(sum2[15:0]));
    add16 third (.a(a[31:16]),.b(b[31:16]),.cin(1),.cout(),.sum(sum3[15:0]));
always @(*)begin
    sum[15:0]=sum1[15:0];
case(cout1)
    1'b0 :sum[31:16] = sum2[15:0];
    1'b1 :sum[31:16] = sum3[15:0];
endcase
end
endmodule
