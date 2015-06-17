`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:42 06/06/2015 
// Design Name: 
// Module Name:    d_edge_detector 
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
module d_edge_detector(
input wire clk, reset,
input wire level,
output reg tick_0, tick_1, counter
    );

localparam [1:0]
	zero = 2'b00,
	edg_0 = 2'b01,
	edg_1 = 2'b10,
	one = 2'b11;
	
	

reg [1:0] state_reg, state_next;


always @(posedge clk, posedge reset)
begin 
if (reset)
	state_reg <= zero;

else 
	state_reg <= state_next;
end

always @*
begin

state_next = state_reg;
tick_0 = 1'b0;
tick_1 = 1'b0;
counter = 1'b0;
case(state_reg)
	zero:
		if(level)
			state_next = edg_0;
	edg_0:
		begin
		tick_0 = 1'b1;
		if(level)
			state_next = one;
		else  
			state_next = zero;
		end
		
	edg_1:
		begin 
			tick_1 = 1'b1;
			if(level)
				state_next = one;
			else 
				state_next = zero;
		end
	one:
		if(~level)
		     begin
			state_next = edg_1;
			counter = 1'b1;
	          end 
	default: state_next = zero;
endcase

end
		


endmodule
