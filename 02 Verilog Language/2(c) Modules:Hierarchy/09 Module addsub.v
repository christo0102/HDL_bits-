module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    reg [31:0]d;
    always @(*)begin
        case(sub)
        1'b0 :d[31:0] =b[31:0];
        1'b1 :d[31:0]=~b[31:0];
        endcase
        end
    wire cout1;
    wire [15:0] sum1,sum2;
    add16 first (.a(a[15:0]),.b(d[15:0]),.cin(sub),.cout(cout1),.sum(sum1));
    add16 second (.a(a[31:16]),.b(d[31:16]),.cin(cout1),.cout(),.sum(sum2));
    assign sum[31:0]={sum2,sum1};
endmodule
