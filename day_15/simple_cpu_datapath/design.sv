module simple_cpu_datapath(
    input clk,
    input reset,
    input [1:0] control,
    input [7:0] data_in_A,
    input [7:0] data_in_B,
    output [7:0] result
);

reg [7:0] regA, regB, regOut;
wire [7:0] alu_result;

// ALU
reg [7:0] alu_out;
always @(*) begin
    case (control)
        2'b00: alu_out = regA + regB; // ADD
        2'b01: alu_out = regA - regB; // SUB
        2'b10: alu_out = regA & regB; // AND
        2'b11: alu_out = regA | regB; // OR
        default: alu_out = 8'b00000000;
    endcase
end

// MUX (select ALU output)
assign alu_result = alu_out;

// Registers update on clock
always @(posedge clk or posedge reset) begin
    if (reset) begin
        regA <= 8'b0;
        regB <= 8'b0;
        regOut <= 8'b0;
    end else begin
        regA <= data_in_A;
        regB <= data_in_B;
        regOut <= alu_result;
    end
end

assign result = regOut;

endmodule
