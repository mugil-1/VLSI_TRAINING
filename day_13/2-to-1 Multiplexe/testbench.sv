`timescale 1ns / 1ps
module tb_mux8to1_structural;

reg [7:0] d;
reg [2:0] sel;
wire y;

mux8to1 uut (
    .d(d),
    .sel(sel),
    .y(y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mux8to1_structural);
    d = 8'b10101011;
    sel = 3'b000;
    repeat (8) begin
        #10 sel = sel + 1;
    end
    #10 $finish;
end

initial begin
    $monitor("Time=%0t | Data=%b | Sel=%b | Output=%b", $time, d, sel, y);
end

endmodule
