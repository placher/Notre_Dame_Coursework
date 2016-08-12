module position_counter (
	input 				clk,
	input 				reset,
	input			[7:0]	max,
	input					up,
	input					down,
	input					en,
	output reg 	[7:0]	q);
	
//	Add your code to implement the following behavior:
//	
//	At each rising clock edge, if reset is asserted then set q to 0.
//	Otherwise, if en is asserted and up and down are not both asserted.
//		If up is asserted and q does not equal max, increment q by 1.
//		Otherwise, if down is asserted and q does not equal 0, decrement q by 1
	always @(posedge clk)
		if (reset)
			q = 0;
		else if (en)
			if ( !(up && down))
				if(( up) && (q != max))
					q = q + 1;
				else if ( (down) && (q != 0))
					q = q - 1;

	
endmodule
