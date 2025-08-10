module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

 parameter BYTE1=2'b00,BYTE2 = 2'b01,BYTE3 = 2'b10,DONE=2'b11;
    reg [1:0]state,next_state;
    always @(*)begin
        case(state)
            BYTE1 : next_state = (in[3] == 1'b1)?BYTE2:BYTE1;
            BYTE2 : next_state = BYTE3;
            BYTE3 : next_state = DONE;
            DONE : next_state =(in[3] == 1'b1)?BYTE2:BYTE1;
        endcase
    end
    
    always @(posedge clk)begin
        if(reset)
            state = BYTE1;
        else
            state = next_state;
    end
    assign done = (state ==DONE);

endmodule
