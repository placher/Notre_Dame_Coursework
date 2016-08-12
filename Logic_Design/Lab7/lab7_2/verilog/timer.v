module timer (
	input 				clk,
	input 				reset,
	input					en,
	input 	[25:0]	limit,
	output				at_limit);

	reg [25:0] count;
	
	assign at_limit = (count == limit);
	
//	Add your code to perform the following:
//	
//	At each rising clock edge, if the counter is either reset or
//	is at the limit, then the count should go to 0.  Otherwise,
//	increment the count by 1.
	always @(posedge clk)
		if ((reset) || (count == limit))
			count = 0;
		else
			count = count + 1;
	
	
endmodule
