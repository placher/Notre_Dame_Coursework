`timescale 1ns/1ns

module processor_tb ();
	reg 			clk;
	reg 			reset;
	reg 			up_btn;
	reg 			down_btn;
	reg 			left_btn;
	reg 			right_btn;
	wire 	[7:0]	xpos;
	wire 	[6:0]	ypos;
	wire 			plot;
	
	processor uut (
		.clk			(clk),
		.reset		(reset),
		.up_btn		(up_btn),
		.down_btn	(down_btn),
		.left_btn	(left_btn),
		.right_btn	(right_btn),
		.xpos			(xpos),
		.ypos			(ypos),
		.plot			(plot)
	);
	
	always
		#5 clk = ~clk;
	
	initial begin
		clk = 0; reset = 1;
		up_btn = 0; down_btn = 0; left_btn = 0; right_btn = 0;
		#10 reset = 0;
		#10 up_btn = 1; right_btn = 1; 
		#200;
		#10 down_btn = 1; left_btn = 1; 
		#10 up_btn = 0; right_btn = 0; 
		#200;
		#10 $stop;
	end
	
endmodule
