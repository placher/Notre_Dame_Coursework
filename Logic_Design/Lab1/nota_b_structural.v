module nota_b_structural (
	input a,
	input b,
	output f
	);
	
	wire n0;
	
	not(n0, a);
	and(f, n0, b);
	
endmodule