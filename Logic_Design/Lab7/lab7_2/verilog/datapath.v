module datapath (
	input 			clk,
	input 			reset,
	input 			up_btn,
	input 			down_btn,
	input 			left_btn,
	input 			right_btn,
	input				timer_en,
	input 			pos_count_en,
	output			timer_done,
	output [7:0]	xpos,
	output [6:0]	ypos);
	
	timer update_timer (
		.clk			(clk),
		.reset		(reset),
		.en			(timer_en),
//		.limit		(26'd5_000_000),
		.limit		(26'd2),
		.at_limit	(timer_done)
	);
		
	position_counter xpos_counter (
		.clk		(clk),
		.reset	(reset),
//		.max		(8'd159),
		.max		(8'd4),
		.up		(right_btn),
		.down		(left_btn),
		.en		(pos_count_en),
		.q			(xpos)
	);
	
	wire [0:0] dummy;
	position_counter ypos_counter (
		.clk		(clk),
		.reset	(reset),
//		.max		(8'd119),
		.max		(8'd3),
		.up		(up_btn),
		.down		(down_btn),
		.en		(pos_count_en),
		.q			({dummy, ypos})
	);

endmodule
