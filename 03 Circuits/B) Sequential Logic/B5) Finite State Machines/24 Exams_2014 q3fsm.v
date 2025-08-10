module top_module (
    input clk,
    input reset,        // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A=1'b0, B=1'b1;
    reg state, nstate;
    reg [1:0] cnt, cntr;

    always @(*) begin
        case(state)
            A: nstate = s ? B : A;
            B: nstate = B;
            default: nstate = B;
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= nstate;
    end

    always @(posedge clk) begin
        if(reset) begin
            cnt <= 2'b0;
            cntr <= 2'b0;
        end
        else if(state==A) begin
            cnt <= 2'b0;
            cntr <= 2'b0;
        end
        else if(cntr==3) begin
            cntr<=2'b1;
            cnt <= w;
        end
        else begin
            cntr <= cntr + 1'b1;
            cnt  <= cnt + w;
        end
    end

    assign z = (cnt==2) && (cntr==3);

endmodule
