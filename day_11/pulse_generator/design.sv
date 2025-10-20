module pulse_generator(
    input clk,
    input reset,
    output reg pulse
);

reg [3:0] count;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        count <= 0;
        pulse <= 0;
    end
    else
    begin
        if (count == 4'd9)
        begin
            count <= 0;
            pulse <= 1;
        end
        else
        begin
            count <= count + 1;
            pulse <= 0;
        end
    end
end

endmodule
