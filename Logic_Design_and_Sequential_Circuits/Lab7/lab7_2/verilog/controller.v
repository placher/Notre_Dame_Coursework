module controller (
	input 			clk,
	input 			reset,
	input				timer_done,
	output reg		timer_en,
	output reg		pos_count_en,
	output reg		plot_en);
	
	
	parameter WAIT		= 2'd0;
	parameter UPDATE	= 2'd1;
	parameter PLOT		= 2'd2;
	
	reg [1:0] state, next_state;
			
	always @(posedge clk)
		if (reset)
			state <= WAIT;
		else
			state <= next_state;
	
	always @(*) begin
		timer_en 		= 0;
		pos_count_en 	= 0;
		plot_en			= 0;
		case (state)
			WAIT: begin
				// insert your code here
				timer_en = 1;
				if( timer_done)
					next_state = UPDATE;
				else
					next_state = WAIT;
			end
			
			UPDATE: begin
				// insert your code here
				pos_count_en = 1;
				next_state = PLOT;
			end
			
			PLOT: begin
				plot_en = 1;
				next_state = WAIT;
				// insert your code here
			end
			
			default:	next_state = WAIT;
		endcase
	end

endmodule
