`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:38 06/03/2015 
// Design Name: 
// Module Name:    stop_watch_test 
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
module stop_watch_test(
	input wire clk,
	input wire [1:0] btn,
	output wire [3:0] an,
	output wire [7:0] sseg
    );


wire [3:0] d2, d1, d0;


disp_hex_mux disp_unit
	 (	
		.clk(clk), .reset(1'b0), .hex3(4'b0), .hex2(d2), .hex1(d1), .hex0(d0),
		.dp_in(4'b1101), .an(an), .sseg(sseg)
		);
		
		
		stop_watch_cascade counter_unit
		(
			.clk(clk), .go(btn[1]), .clr(btn[0]), .d2(d2), .d1(d1), .d0(d0)
			
		);
endmodule
