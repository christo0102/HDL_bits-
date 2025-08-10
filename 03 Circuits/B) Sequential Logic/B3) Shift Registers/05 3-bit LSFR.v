module top_module (
    input [2:0] SW,       // R inputs
    input [1:0] KEY,      // KEY[1] = L, KEY[0] = clk
    output reg [2:0] LEDR // Q outputs
);

    wire L = KEY[1];
    wire clk = KEY[0];

    always @(posedge clk) begin
        if (L) begin
            // Parallel load from switches
            LEDR[0] <= SW[0];  // Q0
            LEDR[1] <= SW[1];  // Q1
            LEDR[2] <= SW[2];  // Q2
        end else begin
            // LFSR behavior
            LEDR[0] <= LEDR[2];                // Q0 <= Q2
            LEDR[1] <= LEDR[0];                // Q1 <= Q0
            LEDR[2] <= LEDR[1] ^ LEDR[2];      // Q2 <= Q1 XOR Q2
        end
    end
endmodule
