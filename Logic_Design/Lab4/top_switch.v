module top_switch (
	input wire [13:0] SW,
	input wire [1:0] KEY,
	output wire [6:0] HEX0);
	
	wire [3:0] s;
	
	top top_12(SW[3:0], SW[5:4], SW[7:6], SW[9:8], SW[10], SW[11], SW[13:12], ~KEY[0], s);
	top_display top_display_12(s, HEX0);
endmodule