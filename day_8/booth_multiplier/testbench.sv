module tb_booth_multiplier_2bit;

reg signed [1:0] multiplicand, multiplier;
wire signed [3:0] product;

booth_multiplier_2bit uut (
    .multiplicand(multiplicand),
    .multiplier(multiplier),
    .product(product)
);

initial begin
    $dumpfile("booth_2bit.vcd");
    $dumpvars(0, tb_booth_multiplier_2bit);

    // Monitor signal values (binary and decimal)
    $monitor("Time = %0t | multiplicand = %b (%0d), multiplier = %b (%0d) => product = %b (%0d)",
             $time, multiplicand, multiplicand, multiplier, multiplier, product, product);

    // Test cases
    multiplicand =  2; multiplier =  1; #10;  // 2 * 1 = 2
    multiplicand = -2; multiplier =  1; #10;  // -2 * 1 = -2
    multiplicand = -1; multiplier = -1; #10;  // -1 * -1 = 1
    multiplicand =  1; multiplier = -2; #10;  // 1 * -2 = -2
    multiplicand =  0; multiplier =  2; #10;  // 0 * 2 = 0

    $finish;
end

endmodule
