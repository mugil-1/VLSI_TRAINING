`timescale 1ns / 1ps
module tb_priority_encoder_8to3;

reg [7:0] din;
wire [2:0] dout;
wire valid;

priority_encoder_8to3 uut (
    .din(din),
    .dout(dout),
    .valid(valid)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_priority_encoder_8to3);
    din = 8'b00000000;
    #10 din = 8'b00000001;
    #10 din = 8'b00001001;
    #10 din = 8'b01000010;
    #10 din = 8'b10000000;
    #10 din = 8'b00000100;
    #10 din = 8'b00000000;
    #10 $finish;
end

initial begin
    $monitor("Time=%0t | Input=%b | Output=%b | Valid=%b", $time, din, dout, valid);
end

endmodule
