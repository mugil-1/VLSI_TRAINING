module tb_elevator_controller;

    reg clk, rst, req0, req1;
    wire [0:0] floor;
    wire moving;

    elevator_controller uut (
        .clk(clk),
        .rst(rst),
        .req0(req0),
        .req1(req1),
        .floor(floor),
        .moving(moving)
    );

    initial begin
        $dumpfile("elevator.vcd");
        $dumpvars(0, tb_elevator_controller);
        $monitor("Time=%0t | clk=%b rst=%b req0=%b req1=%b | floor=%b moving=%b",
                 $time, clk, rst, req0, req1, floor, moving);

        clk = 0;
        rst = 1;
        req0 = 0;
        req1 = 0;
        #10 rst = 0;

        // Request to go to Floor 1
        #10 req1 = 1; #10 req1 = 0;

        // Wait and then request to go to Floor 0
        #40 req0 = 1; #10 req0 = 0;

        #50 $finish;
    end

    always #5 clk = ~clk;

endmodule
