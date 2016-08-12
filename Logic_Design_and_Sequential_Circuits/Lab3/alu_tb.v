`timescale 1 ns/1 ns

module alu_tb();
	reg [2:0] a;
	reg [2:0] b;
	reg [1:0] sel;
	wire [6:0] disp;
	
	alu uut(a, b, sel, disp);
	
	initial begin
			 a = 3'b010; b = 3'b110; sel = 2'b00;
		#10 a = 3'b001; b = 3'b111; sel = 2'b01;
		#10 a = 3'b111; b = 3'b111; sel = 2'b10;
		#10 a = 3'b111; b = 3'b101; sel = 2'b11;
		#10;
	end
	
endmodule