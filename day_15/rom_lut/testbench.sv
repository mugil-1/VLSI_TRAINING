`timescale 1ns / 1ps
module tb_rom_lut;

reg [3:0] addr;
wire [7:0] data;

rom_lut uut (
    .addr(addr),
    .data(data)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_rom_lut);

    addr = 0;
    repeat (16) begin
        #10 addr = addr + 1;
    end
    #10 $finish;
end

initial begin
    $monitor("Time=%0t | Addr=%h | Data=%h", $time, addr, data);
end

endmodule
