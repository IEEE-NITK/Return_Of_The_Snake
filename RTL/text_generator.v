module text_generator(clk,value,data);
input clk;
input [7:0]value;
output reg [7:0]data;
always @(posedge clk)
begin
case (value)
            						// Number 0 (0000)
			8'b00000000: data = 8'b00011000;
			8'b00000001: data = 8'b00111100;
			8'b00000010: data = 8'b01111110;
			8'b00000011: data = 8'b01100110;
			8'b00000100: data = 8'b01100110;
			8'b00000101: data = 8'b01100110;
			8'b00000110: data = 8'b01100110;
			8'b00000111: data = 8'b01100110;
			8'b00001000: data = 8'b01111110;
			8'b00001001: data = 8'b00111100;
			8'b00001010: data = 8'b00000000;
			8'b00001011: data = 8'b00000000;
			8'b00001100: data = 8'b00000000;
			8'b00001101: data = 8'b00000000;
			8'b00001110: data = 8'b00000000;
			8'b00001111: data = 8'b00000000;

			// Number 1 (0001)
			8'b00010000: data = 8'b00011000;
			8'b00010001: data = 8'b00111000;
			8'b00010010: data = 8'b01111000;
			8'b00010011: data = 8'b00011000;
			8'b00010100: data = 8'b00011000;
			8'b00010101: data = 8'b00011000;
			8'b00010110: data = 8'b00011000;
			8'b00010111: data = 8'b00011000;
			8'b00011000: data = 8'b01111110;
			8'b00011001: data = 8'b01111110;
			8'b00011010: data = 8'b00000000;
			8'b00011011: data = 8'b00000000;
			8'b00011100: data = 8'b00000000;
			8'b00011101: data = 8'b00000000;
			8'b00011110: data = 8'b00000000;
			8'b00011111: data = 8'b00000000;

			// Number 2 (0010)
			8'b00100000: data = 8'b01111100;
			8'b00100001: data = 8'b01111110;
			8'b00100010: data = 8'b00000110;
			8'b00100011: data = 8'b00000110;
			8'b00100100: data = 8'b00001100;
			8'b00100101: data = 8'b00011000;
			8'b00100110: data = 8'b00110000;
			8'b00100111: data = 8'b01100000;
			8'b00101000: data = 8'b01111110;
			8'b00101001: data = 8'b01111110;
			8'b00101010: data = 8'b00000000;
			8'b00101011: data = 8'b00000000;
			8'b00101100: data = 8'b00000000;
			8'b00101101: data = 8'b00000000;
			8'b00101110: data = 8'b00000000;
			8'b00101111: data = 8'b00000000;

			// Number 3 (0011)
			8'b00110000: data = 8'b01111100;
			8'b00110001: data = 8'b01111110;
			8'b00110010: data = 8'b00000110;
			8'b00110011: data = 8'b00000110;
			8'b00110100: data = 8'b00111100;
			8'b00110101: data = 8'b00111100;
			8'b00110110: data = 8'b00000110;
			8'b00110111: data = 8'b00000110;
			8'b00111000: data = 8'b01111110;
			8'b00111001: data = 8'b01111100;
			8'b00111010: data = 8'b00000000;
			8'b00111011: data = 8'b00000000;
			8'b00111100: data = 8'b00000000;
			8'b00111101: data = 8'b00000000;
			8'b00111110: data = 8'b00000000;
			8'b00111111: data = 8'b00000000;

			// Number 4 (0100)
			8'b01000000: data = 8'b00001100;
			8'b01000001: data = 8'b00011100;
			8'b01000010: data = 8'b00111100;
			8'b01000011: data = 8'b01101100;
			8'b01000100: data = 8'b11001100;
			8'b01000101: data = 8'b11111110;
			8'b01000110: data = 8'b11111110;
			8'b01000111: data = 8'b00001100;
			8'b01001000: data = 8'b00001100;
			8'b01001001: data = 8'b00001100;
			8'b01001010: data = 8'b00000000;
			8'b01001011: data = 8'b00000000;
			8'b01001100: data = 8'b00000000;
			8'b01001101: data = 8'b00000000;
			8'b01001110: data = 8'b00000000;
			8'b01001111: data = 8'b00000000;
			
						// Number 5 (0101)
			8'b01010000: data = 8'b01111110;
			8'b01010001: data = 8'b01111110;
			8'b01010010: data = 8'b01100000;
			8'b01010011: data = 8'b01100000;
			8'b01010100: data = 8'b01111100;
			8'b01010101: data = 8'b01111110;
			8'b01010110: data = 8'b00000110;
			8'b01010111: data = 8'b00000110;
			8'b01011000: data = 8'b01111110;
			8'b01011001: data = 8'b01111100;
			8'b01011010: data = 8'b00000000;
			8'b01011011: data = 8'b00000000;
			8'b01011100: data = 8'b00000000;
			8'b01011101: data = 8'b00000000;
			8'b01011110: data = 8'b00000000;
			8'b01011111: data = 8'b00000000;

			// Number 6 (0110)
			8'b01100000: data = 8'b00111100;
			8'b01100001: data = 8'b01111110;
			8'b01100010: data = 8'b01100000;
			8'b01100011: data = 8'b01100000;
			8'b01100100: data = 8'b01111100;
			8'b01100101: data = 8'b01111110;
			8'b01100110: data = 8'b01100110;
			8'b01100111: data = 8'b01100110;
			8'b01101000: data = 8'b01111110;
			8'b01101001: data = 8'b00111100;
			8'b01101010: data = 8'b00000000;
			8'b01101011: data = 8'b00000000;
			8'b01101100: data = 8'b00000000;
			8'b01101101: data = 8'b00000000;
			8'b01101110: data = 8'b00000000;
			8'b01101111: data = 8'b00000000;

			// Number 7 (0111)
			8'b01110000: data = 8'b01111110;
			8'b01110001: data = 8'b01111110;
			8'b01110010: data = 8'b00000110;
			8'b01110011: data = 8'b00001100;
			8'b01110100: data = 8'b00001100;
			8'b01110101: data = 8'b00011000;
			8'b01110110: data = 8'b00011000;
			8'b01110111: data = 8'b00011000;
			8'b01111000: data = 8'b00011000;
			8'b01111001: data = 8'b00011000;
			8'b01111010: data = 8'b00000000;
			8'b01111011: data = 8'b00000000;
			8'b01111100: data = 8'b00000000;
			8'b01111101: data = 8'b00000000;
			8'b01111110: data = 8'b00000000;
			8'b01111111: data = 8'b00000000;

			// Number 8 (1000)
			8'b10000000: data = 8'b00111100;
			8'b10000001: data = 8'b01111110;
			8'b10000010: data = 8'b01100110;
			8'b10000011: data = 8'b01100110;
			8'b10000100: data = 8'b01111110;
			8'b10000101: data = 8'b00111100;
			8'b10000110: data = 8'b01100110;
			8'b10000111: data = 8'b01100110;
			8'b10001000: data = 8'b01111110;
			8'b10001001: data = 8'b00111100;
			8'b10001010: data = 8'b00000000;
			8'b10001011: data = 8'b00000000;
			8'b10001100: data = 8'b00000000;
			8'b10001101: data = 8'b00000000;
			8'b10001110: data = 8'b00000000;
			8'b10001111: data = 8'b00000000;

			// Number 9 (1001)
			8'b10010000: data = 8'b00111100;
			8'b10010001: data = 8'b01111110;
			8'b10010010: data = 8'b01100110;
			8'b10010011: data = 8'b01100110;
			8'b10010100: data = 8'b01111110;
			8'b10010101: data = 8'b00111110;
			8'b10010110: data = 8'b00000110;
			8'b10010111: data = 8'b00000110;
			8'b10011000: data = 8'b01111110;
			8'b10011001: data = 8'b00111100;
			8'b10011010: data = 8'b00000000;
			8'b10011011: data = 8'b00000000; 
 
            default:data=0;
  
endcase
end
endmodule
