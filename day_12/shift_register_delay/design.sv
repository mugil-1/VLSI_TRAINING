module shift_register_delay #(
    parameter WIDTH = 1,
    parameter DELAY = 4
)(
    input clk,
    input reset,
    input [WIDTH-1:0] din,
    output [WIDTH-1:0] dout
);

reg [WIDTH-1:0] shift_reg [0:DELAY-1];
integer i;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        for (i = 0; i < DELAY; i = i + 1)
            shift_reg[i] <= 0;
    end
    else
    begin
        shift_reg[0] <= din;
        for (i = 1; i < DELAY; i = i + 1)
            shift_reg[i] <= shift_reg[i-1];
    end
end

assign dout = shift_reg[DELAY-1];

endmodule
