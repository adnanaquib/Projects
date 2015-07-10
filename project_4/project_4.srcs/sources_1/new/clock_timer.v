`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2015 04:01:42 PM
// Design Name: 
// Module Name: clock_timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
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


localparam DVSR = 500000;//5000000

reg [19:0] ms_reg;
wire [19:0] ms_next;
reg [3:0] d2_reg, d1_reg, d0_reg;
reg [1:0] state_reg, state_next;
reg [3:0] d2_next, d1_next, d0_next;
//wire d1_en, d2_en, d0_en;
wire ms_tick;
reg [7:0] temp; 
reg [7:0] temp_next; 
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
	temp <= 0;
end
else 
begin

	ms_reg <= ms_next;
	d2_reg <= d2_next;
	d1_reg <= d1_next;
	d0_reg <= d0_next;
	state_reg <= state_next;
	temp <= temp_next;
end 
end


always @ *
begin
	d2_next = d2_reg;
	d1_next = d1_reg;
	d0_next = d0_reg;
	state_next = state_reg;
	temp_next = temp;
	$monitor("temp = %d", temp);
	case(state_reg)
		idle: 
			if(start)
				state_next = stopwatch;
		
		stopwatch:
			begin
			 $display("Entered StopWatch");
			 $display("temp = %d", temp);
				if(stop)
					state_next = done;
				else 
					begin
						if(ms_tick)
							begin
							     temp_next = temp + 1;
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
assign ms_next = (ms_reg == DVSR + 1)? 1'b0:
                 (state_reg == stopwatch)? ms_reg + 1:
                                              ms_reg;
					

endmodule
