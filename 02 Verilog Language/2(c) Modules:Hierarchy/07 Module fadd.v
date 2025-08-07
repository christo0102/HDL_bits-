module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1;
    add16 first (.a(a[15:0]),.b(b[15:0]),.cin(0),.cout(cout1),.sum(sum[15:0]));
    add16 second (.a(a[31:16]),.b(b[31:16]),.cin(cout1),.cout(),.sum(sum[31:16]));
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
       assign sum = a^b^cin;
       assign cout =a&b | a&cin | b&cin;
endmodule
