module clock_divider(
    input clk,
    input reset,
    output reg clk_div2,
    output reg clk_div4,
    output reg clk_div10
);

reg [1:0] count4;
reg [3:0] count10;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        clk_div2 <= 0;
        clk_div4 <= 0;
        clk_div10 <= 0;
        count4 <= 0;
        count10 <= 0;
    end
    else
    begin
        clk_div2 <= ~clk_div2;
        if (count4 == 2'b01)
        begin
            clk_div4 <= ~clk_div4;
            count4 <= 0;
        end
        else
            count4 <= count4 + 1;
        if (count10 == 4'd4)
        begin
            clk_div10 <= ~clk_div10;
            count10 <= 0;
        end
        else
            count10 <= count10 + 1;
    end
end

endmodule
