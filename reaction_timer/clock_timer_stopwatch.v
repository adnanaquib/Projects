`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:41 06/20/2015 
// Design Name: 
// Module Name:    clock_timer_stopwatch 
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
module clock_timer_stopwatch(
input wire clk,
input wire clr, stop, start,
output wire [3:0] d2, d1, d0,
output reg done_tick 
);


localparam DVSR = 5000000;

reg [22:0] ms_reg;
reg [22:0] ms_next;
reg [3:0] d2_reg, d1_reg, d0_reg;
reg [1:0] state_reg, state_next;
reg [3:0] d2_next, d1_next, d0_next;
//wire d1_en, d2_en, d0_en;
wire ms_tick;


//State Diagrams 

localparam [1:0]
	idle = 2'b00,
	stopwatch = 2'b01,
	done = 2'b10;


always @(posedge clk, posedge clr)
begin
if (clr)
begin
	ms_reg <= 0;
	d2_reg <= 0;
	d1_reg <= 0;
	d0_reg <= 0;
	state_reg <= 0;
end
else 
begin

	ms_reg <= ms_next;
	d2_reg <= d2_next;
	d1_reg <= d1_next;
	d0_reg <= d0_next;
	state_reg <= state_next;
end 
end


always @ *
begin
	ms_next = ms_reg;
	d2_next = d2_reg;
	d1_next = d1_reg;
	d0_next = d0_reg;
	state_next = state_reg;
	
	case(state_reg)
		idle: 
			if(start)
				state_next = stopwatch;
		
		stopwatch:
			begin
				if(stop)
					state_next = done;
				else 
					begin
						ms_next = ms_reg + 1;
						if(ms_tick)
							begin
								if(d0_reg !=9)
									d0_next = d0_reg + 1;
								
								else 
								begin
									d0_next = 4'b0;
									if(d1_reg != 9)
										d1_next = d1_reg+1;
									else
										begin
											d1_next = 4'b0;
											if(d2_reg != 9)
												d2_next = d2_reg + 1;
											else
												d2_next = 4'b0;
										end
								end
							end
					end
				
					
			end
		
		done:
			begin
				done_tick = 1'b1;
				state_next = idle;
			end 
		
		default:
			state_next = idle; 
	endcase 
			
end

assign ms_tick = (ms_reg == DVSR) ? 1'b1:1'b0;			
assign d0 = d0_reg;
assign d1 = d1_reg;
assign d2 = d2_reg;
					

endmodule
