module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire dot;
    assign dot =~(in1^in2);
    assign out =(dot^in3);
endmodule
