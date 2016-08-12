module adder_switch(
	input wire [6:0] SW,
	output wire [6:0] HEX0);
	
	wire [3:0] s;
	
	ripple_carry_adder ripple_carry_adder_12(SW[3:1], SW[6:4], SW[0], s);
	adder_display adder_display_12(s, HEX0);
	
endmodule