module instruction_decoder(
    input [7:0] instr,
    output reg [1:0] alu_op,
    output reg [1:0] rd,
    output reg [1:0] rs,
    output reg reg_write
);

always @(*) begin
    alu_op = instr[7:6];
    rd = instr[5:4];
    rs = instr[3:2];
    reg_write = 1'b1;
end

endmodule
