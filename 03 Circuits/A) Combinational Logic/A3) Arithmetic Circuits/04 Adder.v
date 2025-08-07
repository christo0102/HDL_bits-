module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire cout0,cout1,cout2;
    full_adder first(.x(x[0]),.y(y[0]),.cin(),.cout(cout0),.sum(sum[0]));
    full_adder second(.x(x[1]),.y(y[1]),.cin(cout0),.cout(cout1),.sum(sum[1]));
    full_adder third(.x(x[2]),.y(y[2]),.cin(cout1),.cout(cout2),.sum(sum[2]));
    full_adder fourth(.x(x[3]),.y(y[3]),.cin(cout2),.cout(sum[4]),.sum(sum[3]));
endmodule
module full_adder(input x,y,cin,output sum,cout);
    assign sum = x^y^cin;
    assign cout=(x&y)+(y&cin)+(cin&x);
endmodule
