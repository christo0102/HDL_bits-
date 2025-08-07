module top_module( 
    input [99:0] a, b,
    input cin,
    output reg[99:0] cout,
    output reg[99:0] sum );
    reg carry;
    integer i;
    always @(*)begin
        carry = cin;
        for ( i=0;i<100;i++)begin
        sum[i]=a[i]^b[i]^carry;
        cout[i]=(a[i] & b[i]) | (b[i] & carry) | (carry & a[i]);
        carry=cout[i];
    end
    end
endmodule
