module stopwatch_counter(
    input clk,
    input reset,
    output reg [3:0] sec,
    output reg [3:0] tenth,
    output reg [3:0] hundredth
);

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        sec <= 0;
        tenth <= 0;
        hundredth <= 0;
    end
    else
    begin
        if (hundredth == 9)
        begin
            hundredth <= 0;
            if (tenth == 9)
            begin
                tenth <= 0;
                if (sec == 9)
                    sec <= 0;
                else
                    sec <= sec + 1;
            end
            else
                tenth <= tenth + 1;
        end
        else
            hundredth <= hundredth + 1;
    end
end

endmodule
