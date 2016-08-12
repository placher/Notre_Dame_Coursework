module top (
	input [3:0] imm,
	input [1:0] raddr_a,
	input [1:0] raddr_b,
	input [1:0] waddr,
	input wren,
	input reg_imm,
	input [1:0] op,
	input clk,
	output [3:0] y
	);
	
	wire [3:0] din;
	wire [3:0] dout_a;
	wire [3:0] dout_b;
	wire [3:0] dout_c;

	regfile_2r1w regfile_2r1w_12( raddr_a, raddr_b, waddr, din, wren, clk, dout_a, dout_b);
	mux2x1 mux2x1_12(imm, dout_a, reg_imm, dout_c);
	alu alu_12(dout_c, dout_b, op, din);
	
	assign y = din;
	
endmodule