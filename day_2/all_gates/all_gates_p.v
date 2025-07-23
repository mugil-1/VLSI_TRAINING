module all_gates_tb;
  // Declare signals
  reg a, b;
  wire and_out, nand_out, or_out, nor_out, xor_out, xnor_out, not_out;

  // Instantiate the design under test with inputs connected
  all_gates allg(
    .and_out(and_out),
    .nand_out(nand_out),
    .or_out(or_out),
    .nor_out(nor_out),
    .xor_out(xor_out),
    .xnor_out(xnor_out),
    .not_out(not_out),
    .a(a),
    .b(b)
  );

  initial begin
    $dumpfile("all_gates_tb.vcd");
    $dumpvars;

    $display("A B | AND NAND OR NOR XOR XNOR NOT");
    $monitor("%b %b |  %b    %b    %b   %b    %b     %b     %b",
         a, b, and_out, nand_out, or_out, nor_out, xor_out, xnor_out, not_out);


    // Stimulus
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
  end
endmodule
