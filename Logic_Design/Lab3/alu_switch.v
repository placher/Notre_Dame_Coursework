module alu_switch(
	input wire [7:0] SW,
	output wire [6:0] HEX0);
	
	wire [3:0] s;
	
	alu alu_12(SW[7:5], SW[4:2], SW[1:0], HEX0);
	
endmodule