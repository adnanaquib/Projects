`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:31 06/03/2015 
// Design Name: 
// Module Name:    sq_wave_gen 
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
module sq_wave_gen
#(
		parameter N = 4
	)

(
		input wire clk, reset,
		//input wire [N-1:0] m_ctrl, n_ctrl,
		output wire gen
    );

	
	
	reg [N:0] counter_m_curr = 4'b0;
	wire [N:0] counter_m_next ;
	reg [N:0] counter_n_curr= 4'b1;
	wire [N:0] counter_n_next;
	
	
	wire counter_m_tick, counter_n_tick;
	localparam LOGIC_1 = 10;
	localparam LOGIC_0 = 10;

	reg log_m_curr, log_m_next, log_n_curr, log_n_next, gen_temp; 



//next state logic
	always @(posedge clk, posedge reset)  
		begin
			if(reset)
			begin
				log_m_curr <= 1'b0;
				log_n_curr <= 1'b0;
			end 
			
			else 
				begin
					log_m_curr <= log_m_next;
					log_n_curr <= log_n_next;
				end 
	end 
	
	assign counter_m_next = (counter_m_curr == LOGIC_1 && counter_n_curr != 0)? 1'b0: 
									counter_m_curr + 1;
	assign counter_n_next = (counter_n_curr == LOGIC_0 && counter_m_curr != 0)? 1'b0: 
									counter_n_curr + 1;
	

	assign counter_m_tick = (counter_m_curr == LOGIC_1 || counter_m_curr == 0) ? 1'b0: 1'b1;
	assign counter_n_tick = (counter_n_curr == LOGIC_0 || counter_n_curr == 0) ? 1'b0: 1'b1;
	
	
	
	always @*
			begin
			counter_m_curr = counter_m_next;
			counter_n_curr = counter_n_next;
			
			
			if(counter_m_tick)
					gen_temp = 1'b1;
			
			else if (counter_n_tick)
					gen_temp = 1'b0;
			
			end 
	
	
	assign gen = gen_temp;
	
	


endmodule
