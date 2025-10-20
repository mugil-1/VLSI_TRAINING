`timescale 1ns / 1ps
module tb_shift_register_delay;

reg clk;
reg reset;
reg [3:0] din;
wire [3:0] dout;

shift_register_delay #(.WIDTH(4), .DELAY(4)) uut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(dout)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    din = 4'b0000;
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_shift_register_delay);
    #10 reset = 0;
    #10 din = 4'b0001;
    #10 din = 4'b0010;
    #10 din = 4'b0011;
    #10 din = 4'b0100;
    #10 din = 4'b0101;
    #50 $finish;
end

initial begin
    $monitor("Time=%0t | din=%b | dout=%b", $time, din, dout);
end

endmodule
