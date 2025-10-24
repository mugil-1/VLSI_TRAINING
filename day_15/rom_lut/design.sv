module rom_lut(
    input [3:0] addr,       // 4-bit address (16 locations)
    output reg [7:0] data   // 8-bit output data
);

always @(*) begin
    case (addr)
        4'h0: data = 8'h00;
        4'h1: data = 8'h11;
        4'h2: data = 8'h22;
        4'h3: data = 8'h33;
        4'h4: data = 8'h44;
        4'h5: data = 8'h55;
        4'h6: data = 8'h66;
        4'h7: data = 8'h77;
        4'h8: data = 8'h88;
        4'h9: data = 8'h99;
        4'hA: data = 8'hAA;
        4'hB: data = 8'hBB;
        4'hC: data = 8'hCC;
        4'hD: data = 8'hDD;
        4'hE: data = 8'hEE;
        4'hF: data = 8'hFF;
        default: data = 8'h00;
    endcase
end

endmodule
