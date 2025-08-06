module elevator_controller (
    input clk,
    input rst,
    input req0,    // Request to go to floor 0
    input req1,    // Request to go to floor 1
    output reg [0:0] floor,  // Current floor (0 or 1)
    output reg moving        // 1 if elevator is moving
);

    // State encoding
    parameter IDLE_0 = 2'b00;
    parameter MOVING_UP = 2'b01;
    parameter IDLE_1 = 2'b10;
    parameter MOVING_DOWN = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE_0;
        else
            state <= next_state;
    end


  always @(*) begin
        case (state)
            IDLE_0:
                if (req1)
                    next_state = MOVING_UP;
                else
                    next_state = IDLE_0;

            MOVING_UP:
                next_state = IDLE_1;

            IDLE_1:
                if (req0)
                    next_state = MOVING_DOWN;
                else
                    next_state = IDLE_1;

            MOVING_DOWN:
                next_state = IDLE_0;

            default:
                next_state = IDLE_0;
        endcase
    end


  always @(posedge clk or posedge rst) begin
        if (rst) begin
            floor <= 0;
            moving <= 0;
        end else begin
            case (next_state)
                IDLE_0: begin
                    floor <= 0;
                    moving <= 0;
                end
                MOVING_UP: begin
                    floor <= 1;
                    moving <= 1;
                end
                IDLE_1: begin
                    floor <= 1;
                    moving <= 0;
                end
                MOVING_DOWN: begin
                    floor <= 0;
                    moving <= 1;
                end
            endcase
        end
    end

endmodule
