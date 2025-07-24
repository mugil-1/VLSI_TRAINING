module full_adder_tb;
reg x, y, c_in;
wire s, c_out;
 
 full_adder fa(
    .x(x),
    .y(y),
    .c_in(c_in),
    .s(s),
    .c_out(c_out)
  );
     initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars;
    $monitor("At time %0t: x=%b y=%b c_in=%b s=%b c_out=%b", $time,x,y,c_in,s,c_out);
    

    x = 0; y = 0; c_in =0; #10;
    x = 0; y = 0; c_in =1; #10;
    x = 0; y = 1; c_in =0; #10;
    x = 0; y = 1; c_in =1; #10;
    x = 1; y = 0; c_in =0; #10;
    x = 1; y = 0; c_in =1; #10;
    x = 1; y = 1; c_in =0; #10;
    x = 1; y = 1; c_in =1; #10;

   
    $finish;
  end
endmodule