module top(
	input reset,
	input clk,
	input a,
	input b,
	output reg outWire1,
	output reg outWire2,
	output [1:0] outState);
	
	reg [1:0] state;
	reg [1:0] next_state;

	always @(posedge clk)
		if (reset == 1)
			state <= 0;
		else
			state <= next_state;

	always @(posedge clk) 
		begin
		outWire1 = 0; outWire2 = 0;
		case (state)
			0: begin
				if (a)
					next_state = 1;
				else
					next_state = 0;
			end
			1: begin
				outWire1 = 1;
				if (!a)
					next_state = 2;
				else
					next_state = 1;
			end
			2: begin
				outWire1 = 1;
				if (b)
					next_state = 3;
				else
					next_state = 2;
			end
			3: begin
				outWire1 = 1;
				outWire2 = 1;
				if (!b)
					next_state = 0;
				else
					next_state = 1;
			end
			default: begin
				next_state = 0;
			end
		endcase
	end
	
	assign outState=state;
	
endmodule
