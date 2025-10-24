`timescale 1ns / 1ps
module tb_digital_lock;

reg clk;
reg reset;
reg key_in;
reg enter;
wire locked, unlocked;

digital_lock uut (
    .clk(clk),
    .reset(reset),
    .key_in(key_in),
    .enter(enter),
    .locked(locked),
    .unlocked(unlocked)
);

always #5 clk = ~clk;

task press(input bit val);
    begin
        key_in = val;
        enter = 1; #10;
        enter = 0; #10;
    end
endtask

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_digital_lock);

    clk = 0; reset = 1; key_in = 0; enter = 0;
    #10 reset = 0;

    // Correct password sequence: 1 0 1 1
    press(1);
    press(0);
    press(1);
    press(1);

    #20;

    // Wrong password sequence: 1 1 0 1
    reset = 1; #10 reset = 0;
    press(1);
    press(1);
    press(0);
    press(1);

    #20 $finish;
end

initial begin
    $monitor("Time=%0t | key_in=%b | state_locked=%b | unlocked=%b", 
             $time, key_in, locked, unlocked);
end

endmodule
