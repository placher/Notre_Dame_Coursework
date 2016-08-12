module alu(
	input [2:0] a,
	input [2:0] b,
	input [1:0] sel,
	output [6:0] disp
	);
	
	wire [2:0] f;
	wire overflow;
	
	alu_calculate alu_calculate_12(a, b, sel, f, overflow);
	alu_display alu_display_12(f, overflow, disp);
	
endmodule