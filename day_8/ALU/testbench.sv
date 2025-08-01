module tb_alu_4bit;

reg [3:0] A, B;
reg [2:0] sel;
wire [7:0] result;

alu_4bit uut (
    .A(A), .B(B), .sel(sel), .result(result)
);

initial begin
    $dumpfile("alu_4bit.vcd");
    $dumpvars(0, tb_alu_4bit);

    $monitor("Time=%0t | A=%b B=%b Sel=%b => Result=%b (%0d)",
              $time, A, B, sel, result, result);

    A = 4'b0011; B = 4'b0001; sel = 3'b000; #10;  
    sel = 3'b001; #10;  
    sel = 3'b010; #10;  
    sel = 3'b011; #10;  
    sel = 3'b100; #10;  
    sel = 3'b101; #10;  
    sel = 3'b110; #10;  
    sel = 3'b111; #10;  

    $finish;
end

endmodule
