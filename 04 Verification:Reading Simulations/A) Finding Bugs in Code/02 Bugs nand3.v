module top_module (input a, input b, input c, output out);//
    wire star;
    andgate inst1 ( .a(a), .b(b), .c(c),.d(1'b1),.e(1'b1),. out(star) );
    assign out = ~star;
endmodule
