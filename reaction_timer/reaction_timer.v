`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:22 06/15/2015 
// Design Name: 
// Module Name:    reaction_timer 
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
module reaction_timer(
		input wire start, stop, clear, reset,
		output reg [15:0] times,
		output wire led
    );


localparam [3:0]
	idle 	= 4'b0000,
	wait_0 	= 4'b0001,
	wait_1	= 4'b0010,
	wait_2	= 4'b0011,
	wait_3	= 4'b0100,
	wait_4	= 4'b0101,
	wait_5	= 4'b0110,
	wait_6	= 4'b0111,
	wait_7	= 4'b1000,
	wait_8	= 4'b1001,
	wait_stop = 4'b1010,
	done 	= 4'b1011;
	
	
localparam n = 27;
reg [2:0] state_reg, state_next;
reg led_out, led_next;
reg [N-1] q_reg;
reg [N-1] q_next;
wire m_tick;



always @(posedge clk, posedge reset)
begin
	if(reset)
		q_reg <= 0;
	else
		q_reg <= q_next;
end

assign q_next = q_reg + 1;

assign m_tick = (q_reg == 0) ? 1'b1 : 1'b0;


always @(posedge clk, posedge reset)
	begin 
		if(reset)
			begin
			state_reg <= idle;
			led_out <= 0;
			end
		else 
			begin
			state_reg <= state_next;
			led_out <= led_next;
			end 
	end 

	
always @*
begin 
	state_next = state_reg;
	led_next = led_reg;
	case (state_reg)
		idle:
			if(start)
				begin
					state_next = start;
				end 
		
		wait_0:
			begin
				if(m_tick)
					




  	
endmodule
