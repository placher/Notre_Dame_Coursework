`timescale 1 ns/1 ns

module top_tb();
	reg [3:0] imm;
	reg [1:0] raddr_a;
	reg [1:0] raddr_b;
	reg [1:0] waddr;
	reg wren;
	reg reg_imm;
	reg [1:0] op;
	reg clk;
	
	wire [3:0] dim;
	
	top uut (imm, raddr_a, raddr_b, waddr, wren, reg_imm, op, clk, dim);
	
	always
		#5 clk = ~clk;
	
	initial begin
		clk = 0; wren = 1; op = 0; reg_imm = 1;
	#10 waddr = 0; imm = 0;
	#10 waddr = 1; imm = 1;
	#10 waddr = 2; imm = 2;
	#10 waddr = 3; imm = 3;
	#10 op = 1; reg_imm = 0; waddr = 0; raddr_a = 2; raddr_b = 3;
	#10 op = 3; reg_imm = 0; waddr = 1; raddr_a = 0;
	#10 op = 2; reg_imm = 0; waddr = 1; raddr_a = 1;
	#10 waddr = 2; raddr_a = 2; raddr_b = 3;
	end
		
endmodule