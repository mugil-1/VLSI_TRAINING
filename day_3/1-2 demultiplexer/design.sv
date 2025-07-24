module demux1to2(out0, out1, din, sel);
  input din, sel;       
  output out0, out1;    

  assign out0 = (~sel) & din;   // when sel = 0 → out0 = din
  assign out1 = sel & din;      // when sel = 1 → out1 = din
endmodule
