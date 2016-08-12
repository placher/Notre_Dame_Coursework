module full_adder(
	input a,
	input b,
	input cin,
	output cout,
	output s);
	
	assign cout = (a & b) | (a & cin) | (b & cin);
	assign s = a ^ b ^ cin;
	
endmodule