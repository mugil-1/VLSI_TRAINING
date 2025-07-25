module sr_latch_nor(q, qbar, s, r);
  input s, r;
  output q, qbar;

  wire q_int, qbar_int;

  assign q_int    = ~(s | qbar_int);   
  assign qbar_int = ~(r | q_int);     

  assign q = q_int;
  assign qbar = qbar_int;
endmodule
