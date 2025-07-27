module tb_binary_multiplier;

reg [3:0] a, b;
wire [7:0] product;

binary_multiplier uut (
    .a(a),
    .b(b),
    .product(product)
);

initial begin
    $dumpfile("binary_multiplier.vcd");
    $dumpvars(0, tb_binary_multiplier);

    a = 4'b0011; b = 4'b0101; #10;  
    a = 4'b1111; b = 4'b1111; #10;  
    a = 4'b0001; b = 4'b0010; #10;  
    a = 4'b1000; b = 4'b0001; #10;  
    a = 4'b0000; b = 4'b1111; #10;  

    $finish;
end

endmodule
