module interrupt_controller (
    input clk,
    input reset,
    input [3:0] irq_in,
    output reg irq_valid,
    output reg [1:0] irq_id
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            irq_valid <= 0;
            irq_id <= 0;
        end else begin
            if (irq_in[0]) begin irq_valid <= 1; irq_id <= 2'b00; end
            else if (irq_in[1]) begin irq_valid <= 1; irq_id <= 2'b01; end
            else if (irq_in[2]) begin irq_valid <= 1; irq_id <= 2'b10; end
            else if (irq_in[3]) begin irq_valid <= 1; irq_id <= 2'b11; end
            else begin irq_valid <= 0; irq_id <= 0; end
        end
    end
endmodule
