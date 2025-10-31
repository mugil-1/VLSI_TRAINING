module tb_alu_8bit_flags;
    reg [7:0] A, B;
    reg [2:0] ALUop;
    wire [7:0] result;
    wire Z, C, N;

    alu_8bit_flags dut(A, B, ALUop, result, Z, C, N);

    initial begin
        A=8'h10; B=8'h20; ALUop=3'b000; #10;
        A=8'hFF; B=8'h01; ALUop=3'b000; #10;
        A=8'h05; B=8'h05; ALUop=3'b001; #10;
        A=8'h80; B=8'h00; ALUop=3'b010; #10;
        A=8'h0F; B=8'hF0; ALUop=3'b011; #10;
        A=8'h55; B=8'hAA; ALUop=3'b100; #10;
        $finish;
    end
endmodule
