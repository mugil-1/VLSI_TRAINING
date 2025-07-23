module tb_three_bit_not;
  reg [2:0]in;
  wire[2:0] out;
  
  three_bit_not uut(
    .in(in),
    .out(out)
  );
  
  initial begin
    
    $dumpfile("three_bit_not_tb.vcd");
    $dumpvars(0,tb_three_bit_not);
    
    $monitor("%g\t%b\t%b", $time, in ,out);
    
    in = 3'b000; #10;
    in = 3'b001; #10;
    in = 3'b101; #10;
    in = 3'b111; #10;
    $finish;
  end
endmodule