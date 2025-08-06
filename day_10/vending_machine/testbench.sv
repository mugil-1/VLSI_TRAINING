module tb_vending_machine;

    reg clk, rst;
    reg in_5, in_10;
    wire dispense;

    vending_machine vm (
        .clk(clk),
        .rst(rst),
        .in_5(in_5),
        .in_10(in_10),
        .dispense(dispense)
    );

    initial begin
        $dumpfile("vending_machine.vcd");
        $dumpvars(0, tb_vending_machine);
        $monitor("Time=%0t | in_5=%b in_10=%b | dispense=%b", 
                 $time, in_5, in_10, dispense);

        clk = 0;
        rst = 1;
        in_5 = 0;
        in_10 = 0;

        #10 rst = 0;


      #10 in_5 = 1; #10 in_5 = 0;


      #10 in_10 = 1; #10 in_10 = 0;

        #20;


      #10 in_10 = 1; #10 in_10 = 0;
        #10 in_5 = 1; #10 in_5 = 0;

        #20 $finish;
    end

    always #5 clk = ~clk;

endmodule
