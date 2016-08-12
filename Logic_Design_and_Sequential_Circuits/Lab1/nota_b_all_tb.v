`timescale 1 ns/1 ns

module nota_b_all_tb();
	reg a;
	reg b;
	wire f_structural;
	wire f_always;
	
	nota_b uut(a, b, f_structural, f_always);
	
	initial begin
	a = 0;	b = 0;
	#10 a = 0;	b = 1;
	#10 a = 1;	b = 0;
	#10 a = 1;	b = 1;
	#10;
	end
	
endmodule