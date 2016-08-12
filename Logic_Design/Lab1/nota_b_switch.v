module nota_b_switch(
	input wire SW0,
	input wire SW1,
	output LED_RED0 );
	
	nota_b_always nota_b_12(SW0, SW1, LED_RED0);
	
endmodule