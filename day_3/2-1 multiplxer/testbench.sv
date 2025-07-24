module test_mux2to1;
  reg a, b, sel;
  wire out;


  mux2to1 m1(out, a, b, sel);

  initial begin
    $dumpfile("mux2to1.vcd");
    $dumpvars(0, test_mux2to1);

  
    a = 0; b = 0; sel = 0; #10;
    a = 0; b = 1; sel = 0; #10;
    a = 1; b = 0; sel = 0; #10;
    a = 1; b = 1; sel = 0; #10;

    a = 0; b = 0; sel = 1; #10;
    a = 0; b = 1; sel = 1; #10;
    a = 1; b = 0; sel = 1; #10;
    a = 1; b = 1; sel = 1; #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0d | sel=%b a=%b b=%b => out=%b", $time, sel, a, b, out);
  end
endmodule
