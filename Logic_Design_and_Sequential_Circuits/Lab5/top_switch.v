module top_switch(
	input wire CLOCK_50,
	input wire [2:0] KEY,
	output wire [1:0] LEDG,
	output wire [6:0] HEX0);
	
	wire [1:0] s;
	
	top top_12(~KEY[2],CLOCK_50, ~KEY[0], ~KEY[1], LEDG[0], LEDG[1], s);
	top_display top_display_12(s, HEX0);
	
endmodule