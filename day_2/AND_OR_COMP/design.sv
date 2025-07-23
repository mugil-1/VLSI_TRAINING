module and_or_comb(
    output y,
    input a,
    input b,
    input c,
    input d
);
    assign y = (a & b) | (c & d);  // AND-OR combination
endmodule
