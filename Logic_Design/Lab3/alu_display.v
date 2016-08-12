module alu_display(
	input [2:0] s,
	input ovfl,
	output reg [6:0] f);
	
	always @(s, ovfl) begin
		case (s)
			4'b0000: f = 7'b1000000;
			4'b0001: f = 7'b1111001;
			4'b0010: f = 7'b0100100;
			4'b0011: f = 7'b0110000;
			4'b0100: f = 7'b0011001;
			4'b0101: f = 7'b0010010;
			4'b0110: f = 7'b0000010;
			4'b0111: f = 7'b1111000;
		endcase
		
		if (ovfl) begin
			f = 7'b0000110;
		end
	end
	
endmodule