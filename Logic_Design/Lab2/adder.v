module adder(
	input [2:0] a,
	input [2:0] b,
	input cin,
	output [3:0] s,
	output [6:0] f
	);
	
	ripple_carry_adder ripple_carry_adder_0(a, b, cin, s);
	adder_display adder_display_0(s, f);
	
endmodule