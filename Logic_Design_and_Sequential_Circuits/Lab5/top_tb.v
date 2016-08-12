`timescale 1 ns/1 ns

module top_tb ();
	reg reset;
	reg clk;
	reg a;
	reg b;
	wire outWire1;
	wire outWire2;
	wire [1:0] state;

	top uut( reset, clk, a, b, outWire1, outWire2,	state );
	
	always
		#5 clk = ~clk;
	
	initial begin
			clk = 0; reset = 1; a = 0; b = 0;
	#10	a = 1; reset = 0;
	#10	a = 0;
	#10	b = 1;
	#10	b = 0;
	end

endmodule