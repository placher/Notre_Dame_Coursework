module alu (
	input [3:0] a,
	input [3:0] b,
	input [1:0] op, 
	output reg [3:0] y
	);
	
	always @(*)
		case (op)
			0:	y = a;
			1:	y = a + b;
			2: y = a - b;
			3: y = a << 1;
		endcase
		
endmodule