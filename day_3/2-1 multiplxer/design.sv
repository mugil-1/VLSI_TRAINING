module mux2to1(out, a, b, sel);
  input a, b, sel;
  output out;

  assign out = sel ? b : a;
endmodule
