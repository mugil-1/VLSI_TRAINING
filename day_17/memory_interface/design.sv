module memory_interface (
    input clk,
    input read_en,
    input write_en,
    input mem_sel,         // 1 = RAM, 0 = ROM
    input [3:0] addr,
    input [7:0] data_in,
    output reg [7:0] data_out
);

    // Simple ROM (16x8)
    reg [7:0] ROM [0:15];
    initial begin
        ROM[0] = 8'h11; ROM[1] = 8'h22; ROM[2] = 8'h33; ROM[3] = 8'h44;
        ROM[4] = 8'h55; ROM[5] = 8'h66; ROM[6] = 8'h77; ROM[7] = 8'h88;
        ROM[8] = 8'h99; ROM[9] = 8'hAA; ROM[10]= 8'hBB; ROM[11]= 8'hCC;
        ROM[12]= 8'hDD; ROM[13]= 8'hEE; ROM[14]= 8'hFF; ROM[15]= 8'h00;
    end

    // Simple RAM (16x8)
    reg [7:0] RAM [0:15];

    always @(posedge clk) begin
        if (read_en) begin
            if (mem_sel)    // Read from RAM
                data_out <= RAM[addr];
            else            // Read from ROM
                data_out <= ROM[addr];
        end
        
        if (write_en && mem_sel) begin
            RAM[addr] <= data_in;  // Write only to RAM
        end
    end
endmodule
