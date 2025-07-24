module test_demux1to2;
  reg din, sel;
  wire out0, out1;

 
  demux1to2 d1(out0, out1, din, sel);

  initial begin
    $dumpfile("demux1to2.vcd");
    $dumpvars(0, test_demux1to2);

   
    din = 0; sel = 0; #10;
    din = 1; sel = 0; #10;
    din = 1; sel = 1; #10;
    din = 0; sel = 1; #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0d | din=%b sel=%b => out0=%b out1=%b", 
              $time, din, sel, out0, out1);
  end
endmodule
