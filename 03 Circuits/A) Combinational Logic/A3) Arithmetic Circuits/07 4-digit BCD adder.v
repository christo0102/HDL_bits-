module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire cout0,cout1,cout2;
    fadd first(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(cout0),.sum(sum[3:0]));
    fadd second(.a(a[7:4]),.b(b[7:4]),.cin(cout0),.cout(cout1),.sum(sum[7:4]));
    fadd third(.a(a[11:8]),.b(b[11:8]),.cin(cout1),.cout(cout2),.sum(sum[11:8]));
    fadd fourth(.a(a[15:12]),.b(b[15:12]),.cin(cout2),.cout(cout),.sum(sum[15:12]));
endmodule     
module fadd(input cin,input [3:0]a,input [3:0]b,output reg cout,output reg[3:0]sum);
    reg [4:0]sum0;
    always @(*)begin
         sum0=a+b+cin;
        if(sum0>4'b1001)begin
         sum0 = sum0+4'b0110;    
         cout = 1'b1;
        end
        else begin
        cout = 1'b0;
        end
        sum = sum0[3:0];
    end
endmodule
