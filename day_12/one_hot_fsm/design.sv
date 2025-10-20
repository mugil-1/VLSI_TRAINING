module one_hot_fsm(
    input clk,
    input reset,
    input start,
    output reg [2:0] state
);

parameter IDLE = 3'b001;
parameter S1   = 3'b010;
parameter S2   = 3'b100;

always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= IDLE;
    else
    begin
        case (state)
            IDLE: if (start) state <= S1; else state <= IDLE;
            S1:   state <= S2;
            S2:   state <= IDLE;
            default: state <= IDLE;
        endcase
    end
end

endmodule
