module test_ripple_carry_adder_4bit;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  ripple_carry_adder_4bit uut (
    .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout)
  );

  initial begin
    $dumpfile("ripple_carry.vcd");
    $dumpvars(0, test_ripple_carry_adder_4bit);

    $display("Time\t a\t b\t cin\t | sum\t cout");
    $monitor("%0t\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

    a = 4'b0001; b = 4'b0011; cin = 0; #10;
    a = 4'b0101; b = 4'b0110; cin = 0; #10;
    a = 4'b1111; b = 4'b0001; cin = 0; #10;
    a = 4'b1001; b = 4'b0111; cin = 1; #10;

    $finish;
  end
endmodule
