module full_adder (x, y, c_in, s, c_out);
  input x, y, c_in;
  output s,c_out;
  wire w1, w2, w3, w4;

  xor g1(w1, x, y);
  xor g2(s, w1, c_in);
  and g3(w2, x, y);
  and g4(w3, x, y);
  and g5(w4, y, c_in);
  or g6(c_out, w2, w3, w4);
endmodule