module xnor_data(output c, input a, input b);
    assign c = ~(a ^ b);
endmodule
