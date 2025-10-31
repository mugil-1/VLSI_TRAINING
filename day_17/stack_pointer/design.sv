module stack_pointer (
    input clk,
    input reset,
    input push,
    input pop,
    input [7:0] start_addr,
    output reg [7:0] sp
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sp <= start_addr;
        end else begin
            if (push && !pop) sp <= sp - 1;
            else if (pop && !push) sp <= sp + 1;
        end
    end
endmodule
