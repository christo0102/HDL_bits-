module top_module (input x, input y, output z);
wire a,b,c,d;
assign a= ((x^y) & x);
assign b=~(x^y);
assign c=a|b;
assign d=a&b;
assign z= c^d;
endmodule
