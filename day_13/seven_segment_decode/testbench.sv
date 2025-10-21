`timescale 1ns / 1ps
module tb_seven_segment_decoder;

reg [3:0] bcd;
wire [6:0] seg;

seven_segment_decoder uut (
    .bcd(bcd),
    .seg(seg)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_seven_segment_decoder);
    bcd = 0;
    repeat (10)
    begin
        #10 bcd = bcd + 1;
    end
    #20 $finish;
end

initial begin
    $monitor("Time=%0t | BCD=%b (%0d) | Segments=%b", $time, bcd, bcd, seg);
end

endmodule
