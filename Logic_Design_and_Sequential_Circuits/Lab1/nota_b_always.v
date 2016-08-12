module nota_b_always (
	input a,
	input b,
	output reg f);
	
	always @(a, b) begin
		f = (~a & b);
	end
	
endmodule