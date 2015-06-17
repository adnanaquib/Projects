`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:02 06/14/2015 
// Design Name: 
// Module Name:    period_counter 
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
module period_counter(
		input wire clk, reset,
		input wire start, si,
		output reg ready, done_tick,
		output wire [9:0] prd
    );
	 
	 
	 localparam [1:0]
			idle = 2'b00,
			waite = 2'b01,
			count = 2'b10,
			done = 2'b11;
			
	localparam CLK_MS_COUNT = 50000;
	
	reg [1:0] state_reg, state_next;
	reg [15:0] t_reg, t_next;
	reg [9:0] p_reg, p_next;
	reg delay_reg;
	wire edg;
	
	
	
	
	always @(posedge clk, posedge reset)
		if(reset)
			begin 
				state_reg <= idle;
				t_reg <= 0;
				p_reg <= 0;
				delay_reg <= 0;
			end
	 else 
		begin 
			state_reg <= state_next;
			t_reg <= t_next;
			p_reg <= p_next;
			delay_reg <= si;
		end 
		
		
	assign edg = ~ delay_reg & si;
	
	

	always @ *
	begin 
		state_next = state_reg;
		ready = 1'b0;
		done_tick = 1'b0;
		p_next = p_reg ;
		t_next = t_reg;
		
		case (state_reg)
			idle:
				begin 
					ready = 1'b1;
					if(start)
						state_next = waite;
				end 
			
			waite:
				if(edg)
					begin 
						state_next = count;
						t_next = 0;
						p_next = 0;
					end 
			count:
				if(edg)
					state_next = done;
				else 
					if(t_reg == CLK_MS_COUNT -1)
						begin
							t_next = 0;
							p_next = p_reg + 1;
						end 
					else 
						t_next = t_reg + 1;
						
			done:
				begin 
					done_tick = 1'b1;
					state_next = idle;
				end 
				
			default: state_next = idle;
		endcase 
	end
	
assign prd = p_reg;


endmodule
