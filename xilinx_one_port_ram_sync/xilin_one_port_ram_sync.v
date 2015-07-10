`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:04 06/30/2015 
// Design Name: 
// Module Name:    xilin_one_port_ram_sync 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module xilin_one_port_ram_sync
#(
	parameter ADDR_WIDTH = 12,
			  DATA_WIDTH = 8
)
(
	input wire clk,
	input wire we,
	input wire [ADDR_WIDTH - 1:0] addr,
	input wire [DATA_WIDTH -1 :0] din,
	output wire [DATA_WIDTH-1:0] dout
    );
	
	reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];
	reg [ADDR_WIDTH-1:0] addr_reg;
	
	always@(posedge clk)
	begin 
		if(we)
			ram[addr] <= din;
			addr_reg <= addr;
	end 
	
	assign dout = ram[addr_reg];


endmodule
