module top_module( 
    input [254:0] in,
    output reg[7:0] out );
    always @(*)begin
       out =0;
        for(int i=0;i<=254;i++)begin
            if(0 | in[i]==1)begin
           out =  out +1;
            end
            end
            end              
endmodule
