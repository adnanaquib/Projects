`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:47 06/21/2015 
// Design Name: 
// Module Name:    reaction_timer_test 
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
module reaction_timer_test(
	input clk,
	input [2:0] btn,
	output led,
	output [6:0] sseg,
	output [3:0] an
    );

	wire start_clock, stop_clock;//, en;
	wire [3:0] d2, d1, d0;
	wire clear;

	assign clear = btn[0];
		// Add an if condition and another output wire called en in reaction timer for custom messages on 
		// Display to change d2, d1 and d0 values (First test in this state)
reaction_timer new_one 
		(
			.clk(clk),
			.start(btn[1]), .stop(btn[2]), .reset(clear), .led(led), .done_tick(),
			.start_clock(start_clock)
		);
		
		stop_watch_cascade counter_unit
		(
			.clk(clk), .go(start_clock), .clr(clear), .d2(d2), .d1(d1), .d0(d0)
			
		);
		
			
disp_hex_mux disp_unit
	 (	
		.clk(clk), .reset(1'b0), .hex3(4'b0), .hex2(d2), .hex1(d1), .hex0(d0),
		.dp_in(4'b1101), .an(an), .sseg(sseg)
		);
		
endmodule
