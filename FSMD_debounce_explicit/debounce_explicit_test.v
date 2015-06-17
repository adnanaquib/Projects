`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:16 06/07/2015 
// Design Name: 
// Module Name:    debounce_explicit_test 
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
module debounce_explicit_test(
			input wire clk, reset,
			input wire [1:0] btn,
			output wire [3:0] an,
			output wire [7:0] sseg
    );



reg [7:0] b_reg, d_reg;
wire [7:0] b_next, d_next;
reg btn_reg;

wire db_tick, btn_tick, clr;


disp_hex_mux disp_unit 
	(.clk(clk), .reset(reset), .hex3(b_reg[7:4]), .hex2(b_reg[3:0]), .hex1(d_reg[7:4]), 
	.hex0(d_reg[3:0]), .dp_in(4'b1011), .an(an), .sseg(sseg));
	

debounce_explicit debounce
	(	
	.clk(clk), .reset(reset), .sw(btn[1]), .db_level(), .db_tick(db_tick)
	
	);
	

always @(posedge clk)
	btn_reg <= btn[1];

assign btn_tick = ~btn_reg & btn[1];

assign clr = btn[0];


always @(posedge clk)
	begin 
		d_reg <= d_next;
		b_reg <= b_next;
	end 

assign b_next = (clr) ? 0:
					 (btn_tick) ? b_reg + 1:
									  b_reg;


assign d_next = (clr) ? 0:
					 (db_tick) ? d_reg + 1:
									 d_reg;




endmodule
