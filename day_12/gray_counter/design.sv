module gray_counter(
    input clk,
    input reset,
    output reg [3:0] gray
);

reg [3:0] bin;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        bin <= 0;
        gray <= 0;
    end
    else
    begin
        bin <= bin + 1;
        gray <= (bin + 1) ^ ((bin + 1) >> 1);
    end
end

endmodule
