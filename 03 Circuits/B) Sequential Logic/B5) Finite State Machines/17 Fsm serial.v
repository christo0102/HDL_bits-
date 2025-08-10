module top_module(
    input clk,
    input in,
    input reset,
    output reg done
);

    parameter IDLE = 2'd0, DATA = 2'd1, WAIT_STOP = 2'd2;
    reg [1:0] state, next_state;

    reg [3:0] count;

    always @(posedge clk) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE: begin
                if (in == 0)
                    next_state = DATA;
                else
                    next_state = IDLE;
            end
            DATA: begin
                if (count == 4'd8)
                    if (in == 1)
                        next_state = IDLE;
                    else
                        next_state = WAIT_STOP;
                else
                    next_state = DATA;
            end
            WAIT_STOP: begin
                if (in == 1)
                    next_state = IDLE;
                else
                    next_state = WAIT_STOP;
            end
            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            done <= 0;
        end else begin
            done <= 0;
            case (state)
                IDLE: count <= 0;
                DATA: begin
                    count <= count + 1;
                    if (count == 4'd8 && in == 1)
                        done <= 1;
                end
            endcase
        end
    end

endmodule
