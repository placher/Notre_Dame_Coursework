module processor (
	input 			clk,
	input 			reset,
	input 			up_btn,
	input 			down_btn,
	input 			left_btn,
	input 			right_btn,
	output 	[7:0]	xpos,
	output 	[6:0]	ypos,
	output 			plot
	);
	
	wire timer_done;
	wire timer_en;
	wire pos_count_en;
	
	controller controller_0 (
		.clk				(clk),
		.reset			(reset),
		.timer_done		(timer_done),
		.timer_en		(timer_en),
		.pos_count_en	(pos_count_en),
		.plot_en			(plot)
	);
	
	datapath datapath_0 (
		.clk				(clk),
		.reset			(reset),
		.up_btn			(up_btn),
		.down_btn		(down_btn),
		.left_btn		(left_btn),
		.right_btn		(right_btn),
		.timer_en		(timer_en),
		.pos_count_en	(pos_count_en),
		.timer_done		(timer_done),
		.xpos				(xpos),
		.ypos				(ypos)
	);
	
endmodule
