module debouncer(
    input clk,
    input reset,
    input button,
    output reg clean
);

reg [15:0] count;
reg button_sync;
reg button_prev;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        count <= 0;
        button_sync <= 0;
        button_prev <= 0;
        clean <= 0;
    end
    else
    begin
        button_sync <= button;
        if (button_sync == button_prev)
        begin
            if (count < 16'hFFFF)
                count <= count + 1;
            if (count == 16'hFFFF)
                clean <= button_sync;
        end
        else
            count <= 0;
        button_prev <= button_sync;
    end
end

endmodule
