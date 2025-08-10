module top_module(
    input clk,
    input reset,        // Synchronous active-high reset to 1
    input enable,       // Counter runs only when high
    output [3:0] Q,     // Current count
    output c_enable,    // Connected to count4 enable
    output c_load,      // Connected to count4 load
    output [3:0] c_d    // Connected to count4 data input
);

    wire [3:0] curr_Q;

    assign Q = curr_Q;

    // c_enable remains same
    assign c_enable = enable;

    // Load when reset is high, or if we’re about to go from 12 to 13
    assign c_load = reset | (enable && curr_Q == 4'd12);

    // Always load the value 1
    assign c_d = 4'd1;

    // Instantiate the provided counter
    count4 u1 (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(curr_Q)
    );
endmodule
