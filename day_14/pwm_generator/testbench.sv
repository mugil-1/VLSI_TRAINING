`timescale 1ns / 1ps
module tb_pwm_generator;

reg clk;
reg reset;
reg [7:0] duty;
wire pwm_out;

pwm_generator uut (
    .clk(clk),
    .reset(reset),
    .duty(duty),
    .pwm_out(pwm_out)
);

always #5 clk = ~clk; // 100 MHz -> 10 ns period

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_pwm_generator);

    clk = 0;
    reset = 1;
    duty = 8'd0;
    #10 reset = 0;

    // Test different duty cycles
    duty = 8'd64;   #100;   // 25% duty
    duty = 8'd128;  #100;   // 50% duty
    duty = 8'd192;  #100;   // 75% duty
    duty = 8'd255;  #100;   // 100% duty

    #50 $finish;
end

initial begin
    $monitor("Time=%0t | Duty=%d | PWM_out=%b", $time, duty, pwm_out);
end

endmodule
