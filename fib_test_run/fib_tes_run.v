`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:46 06/11/2015 
// Design Name: 
// Module Name:    fib_tes_run 
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
module fib_tes_run(
			input clk,
			//input wire [3:0]bcd0, bcd1,
			output  led
    );


 fib fib_enter
(
	.clk(clk), .reset(1'b0),
	.i(20'd9999),
	.start(1'b1), 
	.ready(), .done_tick(led),
	.f()

);

endmodule
