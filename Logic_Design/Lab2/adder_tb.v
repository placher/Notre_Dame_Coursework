`timescale 1 ns/1 ns

module adder_tb();
	reg [2:0] a;
	reg [2:0] b;
	reg cin;
	wire [3:0]s;
	wire [6:0] f;
	
	adder uut(a, b, cin, s, f);
	
	initial begin
			 a = 3'b010; b = 3'b110; cin = 1;
		#10 a = 3'b001; b = 3'b111; cin = 0;
		#10 a = 3'b111; b = 3'b111; cin = 1;
		#10;
	end
	
endmodule