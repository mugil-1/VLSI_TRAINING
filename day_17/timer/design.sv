module timer (
    input clk,
    input reset,
    input enable,
    input [15:0] limit,     // preset count value
    output reg interrupt
);
    reg [15:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            interrupt <= 0;
        end 
        else if (enable) begin
            if (count >= limit) begin
                count <= 0;        // reset counter after interrupt
                interrupt <= 1;    // generate interrupt pulse
            end 
            else begin
                count <= count + 1;
                interrupt <= 0;
            end
        end
        else begin
            interrupt <= 0;        // disabled timer
        end
    end
endmodule
