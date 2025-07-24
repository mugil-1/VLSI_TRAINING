module tb_full_subtractor;
  reg a, b, B_in;
  wire D, B_out;
  
  full_subtractor fs(a, b, B_in, D, B_out);
  
initial begin
  $monitor("At time %0t: a=%b b=%b, B_in=%b, difference=%b, borrow=%b",$time, a,b,B_in,D,B_out);
  $dumpfile ("tb_full_subtractor.vcd");
  $dumpvars;
  
    a = 0; b = 0; B_in = 0; #1;
    a = 0; b = 0; B_in = 1; #1;
    a = 0; b = 1; B_in = 0; #1;
    a = 0; b = 1; B_in = 1; #1;
    a = 1; b = 0; B_in = 0; #1;
    a = 1; b = 0; B_in = 1; #1;
    a = 1; b = 1; B_in = 0; #1;
    a = 1; b = 1; B_in = 1;
  end
endmodule