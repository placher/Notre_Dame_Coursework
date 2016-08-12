module etch_a_sketch (
	input				CLOCK_50,				//	50 MHz
	input	 [17:0]	SW,
	input	 [3:0]	KEY,
	output [17:0]	LEDR,
	output [7:0]	LEDG,
	output [6:0]	HEX0,
	output [6:0]	HEX1,
	output [6:0]	HEX2,
	output [6:0]	HEX3,
	output [6:0]	HEX4,
	output [6:0]	HEX5,
	output [6:0]	HEX6,
	output [6:0]	HEX7,
	output			VGA_CLK,   				//	VGA Clock
	output			VGA_HS,					//	VGA H_SYNC
	output			VGA_VS,					//	VGA V_SYNC
	output			VGA_BLANK,				//	VGA BLANK
	output			VGA_SYNC,				//	VGA SYNC
	output [9:0]	VGA_R,   				//	VGA Red[9:0]
	output [9:0]	VGA_G,	 				//	VGA Green[9:0]
	output [9:0]	VGA_B	   				//	VGA Blue[9:0]
	);
	
	wire [2:0] color = SW[2:0];
	wire [7:0] x;
	wire [6:0] y;
	wire		  plot;
	
	assign LEDR[17] 		= SW[17];
	assign LEDR[16:3]		= 0;
	assign LEDR[2:0]		= SW[2:0];
	assign LEDG[7:0]		= 0;
	assign HEX1 = 7'h7f, HEX2 = 7'h7f, HEX3 = 7'h7f;
	assign HEX4 = 7'h7f, HEX5 = 7'h7f, HEX6 = 7'h7f, HEX7 = 7'h7f;
	
	hexdigit color_digit (
		.in	({1'b0, SW[2:0]}),
		.out	(HEX0)
	);
	
	processor processor_1 (
		.clk			(CLOCK_50),
		.reset		(SW[17]),
		.up_btn		(~KEY[2]),
		.down_btn	(~KEY[3]),
		.left_btn	(~KEY[1]),
		.right_btn	(~KEY[0]),
		.xpos			(x),
		.ypos			(y),
		.plot			(plot)
	);
	
	vga_adapter VGA(
		.resetn(~SW[17]),
		.clock(CLOCK_50),
		.colour(color),
		.x(x),
		.y(y),
		.plot(plot),
		/* Signals for the DAC to drive the monitor. */
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.VGA_HS(VGA_HS),
		.VGA_VS(VGA_VS),
		.VGA_BLANK(VGA_BLANK),
		.VGA_SYNC(VGA_SYNC),
		.VGA_CLK(VGA_CLK)
	);
	defparam VGA.RESOLUTION = "160x120";
	defparam VGA.MONOCHROME = "FALSE";
	defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
	defparam VGA.BACKGROUND_IMAGE = "background_image.mif";
	
endmodule
