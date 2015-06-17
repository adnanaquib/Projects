`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:01:17 06/02/2015 
// Design Name: 
// Module Name:    hex_mux_test 
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
module hex_mux_test(
input wire clk,
input wire [7:0] sw,
output wire [3:0] an,
output wire [7:0] sseg
    );
	 
	 wire [3:0] a,b;
	 wire [7:0] sum;
	 
	 
	 disp_hex_mux disp_unit
	 (	
		.clk(clk), .reset(1'b0), .hex3(sum[7:4]), .hex2(sum[3:0]), .hex1(a), .hex0(b),
		.dp_in(4'b1011), .an(an), .sseg(sseg)
		);
		
		
		assign a = sw[3:0];
		assign b = sw[7:4];
		assign sum = {4'b0,a} + {4'b0,b};


endmodule
