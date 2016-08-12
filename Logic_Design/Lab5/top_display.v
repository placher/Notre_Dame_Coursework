module top_display(
	input [1:0] s,
	output reg [6:0] f);
	
	always @(s) begin
		case (s)
			0: f = 7'b1000000;
			1: f = 7'b1111001;
			2: f = 7'b0100100;
			3: f = 7'b0110000;
		endcase
	end
	
endmodule