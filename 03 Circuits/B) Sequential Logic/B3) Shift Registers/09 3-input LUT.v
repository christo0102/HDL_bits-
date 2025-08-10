module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [2:0]option;
    assign option ={A,B,C};
    reg Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8;
    flipflop uut1(.clk(clk),.enable(enable),.S(S),.Q(Q1));
    flipflop uut2(.clk(clk),.enable(enable),.S(Q1),.Q(Q2));
    flipflop uut3(.clk(clk),.enable(enable),.S(Q2),.Q(Q3));
    flipflop uut4(.clk(clk),.enable(enable),.S(Q3),.Q(Q4));
    flipflop uut5(.clk(clk),.enable(enable),.S(Q4),.Q(Q5));
    flipflop uut6(.clk(clk),.enable(enable),.S(Q5),.Q(Q6));
    flipflop uut7(.clk(clk),.enable(enable),.S(Q6),.Q(Q7));
    flipflop uut8(.clk(clk),.enable(enable),.S(Q7),.Q(Q8));
    always @(*)begin
        case(option) 
              3'b000 : Z=Q1;
              3'b001 : Z=Q2;
              3'b010 : Z=Q3;
              3'b011 : Z=Q4;
              3'b100 : Z=Q5;
              3'b101 : Z=Q6;
              3'b110 : Z=Q7;
              3'b111 : Z=Q8;
            endcase
        end
endmodule
module flipflop (input clk,enable,S,output Q);
    always @(posedge clk)begin
        if(enable)
            Q<=S;
    end
endmodule
