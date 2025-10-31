module control_unit(
    input clk,
    input reset,
    input [7:0] instr,
    output reg pc_inc,
    output reg pc_load,
    output reg reg_write,
    output reg alu_start,
    output reg [1:0] alu_op,
    output reg [1:0] rd,
    output reg [1:0] rs
);

reg [2:0] state, next_state;

localparam FETCH = 3'b000,
           DECODE = 3'b001,
           EXECUTE = 3'b010,
           WRITEBACK = 3'b011,
           HALT = 3'b111;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= FETCH;
    else
        state <= next_state;
end

always @(*) begin
    pc_inc = 0;
    pc_load = 0;
    reg_write = 0;
    alu_start = 0;
    alu_op = instr[7:6];
    rd = instr[5:4];
    rs = instr[3:2];

    case(state)
        FETCH: begin
            pc_inc = 1;
            next_state = DECODE;
        end

        DECODE: begin
            next_state = EXECUTE;
        end

        EXECUTE: begin
            alu_start = 1;
            next_state = WRITEBACK;
        end

        WRITEBACK: begin
            reg_write = 1;
            next_state = FETCH;
        end

        default: next_state = FETCH;
    endcase
end

endmodule
