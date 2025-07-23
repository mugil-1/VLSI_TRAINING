module tb_two_bit_not;
  reg [1:0]in;
  wire[1:0] out;
  
  two_bit_not uut(
    .in(in),
    .out(out)
  );
  
  initial begin
    
    $dumpfile("two_bit_not_tb.vcd");
    $dumpvars(0,tb_two_bit_not);
    
    $monitor("%g\t%b\t%b", $time, in ,out);
    
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;
    $finish;
  end
endmodule