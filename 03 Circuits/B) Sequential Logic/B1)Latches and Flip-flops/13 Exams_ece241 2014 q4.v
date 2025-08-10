module top_module (
    input clk,
    input reset,
    input x,
    output z
); 
reg D1,D2,D3,Q1,Q2,Q3,Q1_bar,Q2_bar,Q3_bar;
    assign D1=x^Q1;
    assign D2=x & Q2_bar;
    assign D3 = x | Q3_bar;
    assign z = ~(Q1 | Q2 | Q3);
    flipflop first(.D(D1),.clk(clk),.reset(reset),.Q(Q1),.Q_bar(Q1_bar));
    flipflop second(.D(D2),.clk(clk),.reset(reset),.Q(Q2),.Q_bar(Q2_bar));
    flipflop third(.D(D3),.clk(clk),.reset(reset),.Q(Q3),.Q_bar(Q3_bar));
endmodule
module flipflop(input D,clk,reset,output reg Q,Q_bar);
    always @(posedge clk,negedge reset)begin
        if(!reset)begin
            Q<=1'b0;
            Q_bar<=1'b1;
        end
        else begin
            Q<=D;
            Q_bar<=~D;
        end
    end
endmodule
