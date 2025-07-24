module mux4to1(out, a, b, c, d, sel);
  input a, b, c, d;         
  input [1:0] sel;          
  output out;

  assign out = (sel == 2'b00) ? a :
               (sel == 2'b01) ? b :
               (sel == 2'b10) ? c :
               d; // sel == 2'b11
endmodule
