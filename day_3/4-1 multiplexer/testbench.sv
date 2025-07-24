module test_mux4to1;
  reg a, b, c, d;
  reg [1:0] sel;
  wire out;

  // Instantiate the mux
  mux4to1 m1(out, a, b, c, d, sel);

  initial begin
    $dumpfile("mux4to1.vcd");
    $dumpvars(0, test_mux4to1);

    // Test all combinations
    a = 0; b = 1; c = 0; d = 1;

    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    a = 1; b = 0; c = 1; d = 0;

    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0d | sel=%b | a=%b b=%b c=%b d=%b => out=%b", 
              $time, sel, a, b, c, d, out);
  end
endmodule
