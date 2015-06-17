`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:48:15 06/02/2015 
// Design Name: 
// Module Name:    Display_num 
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
module Display_num(

input wire clk,
input wire btn,
output wire [6:0] sseg,
output wire [3:0] an
    );
	 
	 reg [3:0] an_enable = 4'b0000;
	
	 reg [25:0] clk_divide = 26'b0;
	 
	 always @(posedge clk)
		begin 
		clk_divide = clk_divide + 1;
	end
	
	 always @(posedge clk_divide [26])
		begin 
		if (!btn)
		an_enable = an_enable + 1;
		
		end 
	 
	 
assign an = an_enable;
assign sseg = 7'b1000000;


endmodule
