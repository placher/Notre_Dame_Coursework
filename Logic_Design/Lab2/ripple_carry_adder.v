module ripple_carry_adder (
	input [2:0] a,
	input [2:0] b,
	input cin,
	output [3:0] s
	);
	
	wire cout_0, cout_1;
	
	full_adder full_adder_0(a[0], b[0], cin, cout_0, s[0]);
	full_adder full_adder_1(a[1], b[1], cout_0, cout_1, s[1]);
	full_adder full_adder_2(a[2], b[2], cout_1, s[3], s[2]);
	
endmodule