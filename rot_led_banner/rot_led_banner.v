`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:04 06/04/2015 
// Design Name: 
// Module Name:    rot_led_banner 
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
module rot_led_banner
#(parameter N = 10)

(
input wire clk,
input wire en,
input wire dir,
input wire reset,
input wire [N*4 - 1:0] data ,

output reg [3:0] an,

output reg [6:0] sseg

);

localparam DVSR = 50000000;

reg [26:0]clk_counter;
wire [26:0] clk_counter_next;



reg [4:0] counter;
wire [4:0] counter_next;

wire counter_tick;

reg [17:0] led_tick;
wire[17:0] led_tick_next;

/*

add a refresh rate for the LCD display!!!


*/
always @ (posedge clk, posedge reset)
begin 
if (reset)
	begin
	clk_counter <= 0;
	counter <=0;
	led_tick <=0;
	end

else 
	begin
		clk_counter <= clk_counter_next;
		counter <= counter_next;
		led_tick <= led_tick_next;
	end 
	
end


assign clk_counter_next = (clk_counter < DVSR ) ? clk_counter + 1: 0;

assign counter_tick = (clk_counter == DVSR)? 1'b1: 1'b0;

assign counter_next = (counter > 27)? 3:
							 (!counter_tick)? counter:
							 (en)?counter:
							 (!dir)? counter + 4 
							 :counter - 4;
							 
							 

assign led_tick_next = led_tick + 1;

reg [3:0] sseg_data;





always @*
	begin
		case(led_tick[17:16])
			2'b00 : 
				begin 
					sseg_data = /*counter;*/data[counter -:4];
					an[3:0] = 4'b0111;
				end
			
			2'b01 : 
				begin 
					sseg_data = /*counter+4;*/data[counter+4 -:4];
					an[3:0] = 4'b1011;
				end
			
			2'b10 : 
				begin 
					sseg_data = /*counter+8;*/data[counter+8 -:4];
					an[3:0] = 4'b1101;
				end
			
			
			2'b11 : 
				begin 
					sseg_data = /*counter+12;*/data[counter+12 -:4];
					an[3:0] = 4'b1110;
				end
		endcase
	end 



 



always @*
	begin
		//if(led_tick[17:16] == 2'b00)
		case(sseg_data)
				4'b0000: sseg[6:0] = 7'b1000000;
				4'b0001: sseg[6:0] = 7'b1111001;
				4'b0010: sseg[6:0] = 7'b0100100;
				4'b0011: sseg[6:0] = 7'b0110000;
				4'b0100: sseg[6:0] = 7'b0011001;
				4'b0101: sseg[6:0] = 7'b0010010;
				4'b0110: sseg[6:0] = 7'b0000010;
				4'b0111: sseg[6:0] = 7'b1111000;
				4'b1000: sseg[6:0] = 7'b0000000;
				4'b1001: sseg[6:0] = 7'b0010000;
				4'b1010: sseg[6:0] = 7'b0001000;
				4'b1011: sseg[6:0] = 7'b0000011;
				4'b1100: sseg[6:0] = 7'b1000110;
				4'b1101: sseg[6:0] = 7'b0100001;
				4'b1110: sseg[6:0] = 7'b0000110;
					default: sseg[6:0] = 7'b0001110;
				//default: sseg[6:0] = 7'b0111000;
		endcase
	end
	
endmodule
