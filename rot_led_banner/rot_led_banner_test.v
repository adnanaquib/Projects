`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:09:59 06/04/2015 
// Design Name: 
// Module Name:    rot_led_banner_test 
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
module rot_led_banner_test(
	input wire clk,
	input wire en,
	input wire dir,

	output wire [3:0] an,
	output wire [6:0] sseg
    );


rot_led_banner #(.N(10)) banner_work_pls 
	( 
		.clk(clk), .en(en), .dir(dir), 
		.reset(1'b0), .data(39'b1001100001110110010101000011001000010000),
		.an(an), .sseg(sseg)

	);

endmodule
