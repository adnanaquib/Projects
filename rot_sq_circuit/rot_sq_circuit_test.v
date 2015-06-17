`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:45 06/03/2015 
// Design Name: 
// Module Name:    rot_sq_circuit_test 
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
module rot_sq_circuit_test(
		input clk,
		output wire [6:0] sseg,
		output wire [3:0] an
    );



rot_sq_circuit work 
(
	.clk(clk), .reset(1'b0), .sseg(sseg), .an(an)

);

endmodule
