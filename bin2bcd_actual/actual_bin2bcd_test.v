`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:58 06/11/2015 
// Design Name: 
// Module Name:    actual_bin2bcd_test 
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
module actual_bin2bcd_test(
			input wire clk,
			//input wire [3:0]bcd0, bcd1,
			output wire [6:0] sseg,
			output wire [3:0] an
    );



wire [3:0] hex0,hex1,hex2,hex3;
wire done_start,disp_done;

		
bin2bcd bin2bcd1
(
		.clk(clk), .reset(1'b0),
		.start(1'b1),
		.bin(12'b 11111111111),
		.bcd3(hex3), .bcd2(hex2), .bcd1(hex1), .bcd0(hex0),
		.ready(), .done_tick(done_start)
 );



disp_hex_mux disp_unit(	
		.clk(clk), .reset(1'b0), .hex3(hex3), .hex2(hex2), .hex1(hex1), .hex0(hex0),
		.dp_in(4'b1011), .an(an), .sseg(sseg) //.start(done_start)
);
		
		

endmodule
