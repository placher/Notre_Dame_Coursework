module mux2x1 (
	input [3:0] imm,
	input [3:0] dout_a,
	input reg_imm,
	output reg [3:0] a
	);
	
	always @(*) begin
		case (reg_imm)
			0: a = dout_a;
			1: a = imm;
		endcase
	end
endmodule