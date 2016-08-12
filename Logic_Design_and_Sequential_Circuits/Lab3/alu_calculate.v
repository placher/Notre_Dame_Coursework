module alu_calculate(
	input [2:0] a,
	input [2:0] b,
	input [1:0] sel,
	output [2:0] f,
	output reg ovfl
	);
	
	reg [3:0] f4;
	
	always @(a, b, sel) begin
		ovfl = 0;
		case (sel)
			0: begin
				f4 = a + b;
				if (f4 >= 7) begin
					ovfl = 1;
				end
			end
			1: begin
				f4 = a - b;
				if (f4[3] == 1) begin
					ovfl = 1;
				end
			end
			2: begin
				f4 = ~a + 1'b1;
			end
			3: begin
				f4 = ~b + 1'b1;
			end
		endcase
	end
	
	assign f = f4[2:0];
	
endmodule