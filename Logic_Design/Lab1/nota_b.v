module nota_b(
	input a,
	input b,
	output f_structural,
	output f_always);
	
	nota_b_structural	nota_b_structural_0	(a, b, f_structural);
	nota_b_always		nota_b_always_0		(a, b, f_always);
	
endmodule