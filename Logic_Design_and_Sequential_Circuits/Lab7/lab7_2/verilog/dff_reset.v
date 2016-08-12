module dff_reset (
	input 		clk,
	input			reset,
	input 		d,
	output reg 	q);
	
	always @(posedge clk)
		if (reset)
			q <= 1'b0;
		else
			q <= d;
			
endmodule
