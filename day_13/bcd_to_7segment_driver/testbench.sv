`timescale 1ns / 1ps
module tb_bcd_to_7segment_driver;

reg [3:0] bcd;
wire [6:0] seg;

bcd_to_7segment_driver uut (
    .bcd(bcd),
    .seg(seg)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_bcd_to_7segment_driver);
    bcd = 0;
    repeat (16) begin
        #10 bcd = bcd + 1;
    end
    #10 $finish;
end

initial begin
    $monitor("Time=%0t | BCD=%b (%0d) | Segments=%b", $time, bcd, bcd, seg);
end

endmodule
