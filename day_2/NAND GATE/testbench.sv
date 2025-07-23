module nand_gate_tb;
      reg a;
      reg b;
      wire c;

  
  nand_gate uut(
    .a(a),
    .b(b),
    .c(c)
    
  );
  
  initial begin
    
    $dumpfile("nand_gate_tb.vcd");
    $dumpvars (0,nand_gate_tb);
    $monitor("%g\t%b\t%b\t%b", $time, a, b, c);
    
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule

