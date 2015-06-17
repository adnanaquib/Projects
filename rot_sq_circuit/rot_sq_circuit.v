`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:11 06/03/2015 
// Design Name: 
// Module Name:    rot_sq_circuit 
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
module rot_sq_circuit(
		input clk,
		input reset,
		output reg [6:0] sseg,
		output reg [3:0] an
    );

	
	reg [26:0] clk_counter;
	wire [26:0] clk_counter_next;

	reg [3:0] led_shift_counter = 4'b0;
	wire [3:0] led_shift_counter_next = 4'b0;
	
	wire counter_tick;
	
	
	always @(posedge clk)
	begin
		clk_counter <= clk_counter_next;
		led_shift_counter <= led_shift_counter_next;
		
		if (clk_counter > 50000000)
			clk_counter <= 0;
		
		if (led_shift_counter > 8)
			led_shift_counter <= 0;

	end 
	
	assign clk_counter_next = (clk_counter == 50000000) ? 4'b0 : clk_counter + 1;

	assign counter_tick = (clk_counter == 50000000) ? 1'b1 : 1'b0;	
	
	
	
	
	always @*
	begin
	//sseg_transfer = 7'b1;
	 
			if(counter_tick)
				begin
					if(led_shift_counter < 4'b0100)
						begin
							case (led_shift_counter)
							4'b0000 : an = 4'b0111;
							4'b0001 : an = 4'b1011;
							4'b0010 : an = 4'b1101;
							4'b0011 : an = 4'b1110;
							//default: an = 4'b1111;
							endcase 
					
							sseg = 7'b0011100;
						end
					else if (led_shift_counter > 4'b0011)
						begin
							case (led_shift_counter)
								4'b0100 : an = 4'b1110;
								4'b0101 : an = 4'b1101;
								4'b0110 : an = 4'b1011;
								4'b0111 : an = 4'b0111;
							endcase
						sseg = 7'b0100011;
						end

					else 
						begin 
							an = 4'b1111;
							sseg = 7'b1111111;
						end 
			
					
				end
					
	end 
			
	
assign led_shift_counter_next = /*(led_shift_counter > 7)? 4'b0 :*/led_shift_counter + 1;


endmodule
