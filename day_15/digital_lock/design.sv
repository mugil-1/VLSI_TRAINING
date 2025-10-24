module digital_lock(
    input clk,
    input reset,
    input key_in,     // single bit input (0 or 1)
    input enter,      // move to next input
    output reg locked,
    output reg unlocked
);

reg [2:0] state, next_state;

// State encoding
parameter IDLE = 3'b000,
          S1   = 3'b001,
          S2   = 3'b010,
          S3   = 3'b011,
          UNLOCK = 3'b100,
          ERROR  = 3'b101;

// Stored password = 1 0 1 1

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else if (enter)
        state <= next_state;
end

always @(*) begin
    next_state = state;
    locked = 0;
    unlocked = 0;

    case (state)
        IDLE:   next_state = (key_in == 1) ? S1 : ERROR;
        S1:     next_state = (key_in == 0) ? S2 : ERROR;
        S2:     next_state = (key_in == 1) ? S3 : ERROR;
        S3:     next_state = (key_in == 1) ? UNLOCK : ERROR;
        UNLOCK: begin
                    unlocked = 1;
                    next_state = UNLOCK;
                end
        ERROR:  begin
                    locked = 1;
                    next_state = ERROR;
                end
        default: next_state = IDLE;
    endcase
end

endmodule
