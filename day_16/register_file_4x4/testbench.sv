`timescale 1ns / 1ps
module tb_register_file_4x4;

reg clk;
reg reset;
reg write_en;
reg [1:0] write_addr;
reg [1:0] read_addr;
reg [3:0] data_in;
wire [3:0] data_out;

register_file_4x4 uut (
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .write_addr(write_addr),
    .read_addr(read_addr),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_register_file_4x4);

    clk = 0; reset = 1; write_en = 0; data_in = 0;
    write_addr = 0; read_addr = 0;

    #10 reset = 0;

    // Write different values to each register
    write_en = 1;
    write_addr = 2'b00; data_in = 4'b1010; #10;
    write_addr = 2'b01; data_in = 4'b1100; #10;
    write_addr = 2'b10; data_in = 4'b1111; #10;
    write_addr = 2'b11; data_in = 4'b0001; #10;

    // Disable write and start reading
    write_en = 0;
    read_addr = 2'b00; #10;
    read_addr = 2'b01; #10;
    read_addr = 2'b10; #10;
    read_addr = 2'b11; #10;

    #10 $finish;
end

initial begin
    $monitor("Time=%0t | WE=%b | Waddr=%b | Raddr=%b | Din=%b | Dout=%b",
             $time, write_en, write_addr, read_addr, data_in, data_out);
end

endmodule
