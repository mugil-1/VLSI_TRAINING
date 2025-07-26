module test_carry_save_adder_4bit;
  reg [3:0] a, b, c;
  wire [3:0] sum, carry;

  carry_save_adder_4bit uut (
    .a(a), .b(b), .c(c),
    .sum(sum), .carry(carry)
  );

  initial begin
    $dumpfile("csa.vcd");
    $dumpvars(0, test_carry_save_adder_4bit);

    a = 4'b0011; b = 4'b0101; c = 4'b1001; #10;
    a = 4'b1111; b = 4'b1111; c = 4'b0001; #10;
    a = 4'b0000; b = 4'b1111; c = 4'b1111; #10;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | A=%b | B=%b | C=%b | SUM=%b | CARRY=%b",
              $time, a, b, c, sum, carry);
  end
endmodule
