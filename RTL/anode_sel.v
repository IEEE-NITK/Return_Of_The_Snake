`timescale 1ns / 1ps
module anode_sel(
    input clk,
    input [2:0] rr,
    output reg [7:0] AN
    );
   
    always @(posedge clk) begin
        case(rr)
            
            3'b000: AN = 8'b01111111;
            3'b001: AN = 8'b10111111;
            3'b010: AN = 8'b11011111;
            3'b011: AN = 8'b11101111;
            3'b100: AN = 8'b11110111;
            3'b101: AN = 8'b11111011;
            3'b110: AN = 8'b11111101;
            3'b111: AN = 8'b11111110;
        endcase
    end
endmodule
