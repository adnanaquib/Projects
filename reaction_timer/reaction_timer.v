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
		output wire led,
		output reg [27:0] bin,
		output wire done_tick, 
		output wire [3:0] bcd0, bcd1, bcd2, bcd3
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

// Check Stopwatch project for timing conversion	
	
localparam n = 27;
reg [2:0] state_reg, state_next;
reg led_out;
wire led_next;
reg [N-1] q_reg;
reg [N-1] q_next;
wire m_tick;
reg [N:0] counter_clock;
wire [N:0] counter_clock_next;
reg [3:0] bcd0_reg, bcd1_reg, bcd2_reg, bcd3_reg;
reg [3:0] bcd0_next, bcd1_next, bcd2_next, bcd3_next;



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
			counter_clock <= 0;
			end
		else 
			begin
			state_reg <= state_next;
			led_out <= led_next;
			counter_clock <= counter_clock_next;
			end 
	end 

	
always @*
begin 
	state_next = state_reg;
	led_next = led_reg;
	counter_clock_next = counter_clock;
	bcd0_next = bcd0_reg;
	bcd1_next = bcd1_reg;
	bcd2_next = bcd2_reg;
	bcd3_next = bcd3_reg;
	
	case (state_reg)
		idle:
			if(start)
				begin
					state_next = start;
					
				end 
		
		wait_0:
			begin
				if(m_tick)
						state_next = wait_1;
			end 
		
		wait_1:
			begin
				if(m_tick)
					state_next = wait_2;
			end 

		wait_2:
			begin
				if(m_tick)
					state_next = wait_3;
			end 
		
		wait_3:
			begin
				if(m_tick)
					state_next = wait_4;
			end
		
		wait_4:
			begin
				if(m_tick)
					state_next = wait_5;
			end 
		
		wait_5:
			begin
				if(m_tick)
					state_next = wait_6;
			end 
		
		wait_6:
			begin
				if(m_tick)
					state_next = wait_7;
			end
		
		wait_7:
			begin
				if(m_tick)
					state_next = wait_8;
			end 
		
		wait_8:
			begin
				if(m_tick)
					state_next = wait_stop;
			end 
		
		wait_stop:
			begin
				led_out = 1'b1;
				counter_clock_next = counter_clock + 1;
				if(stop)
					state_next = done;
			end 
		
		// We might need to send counter_clock to division circuit
		// Also recalculate the division, check if the value 50000000 is right
		done:
			begin
				bin = counter_clock;
				done_tick = 1'b1;
			end 
		
		default:
			state_next = idle;
		
		endcase
				
	assign bcd0 = bcd0_reg;
	assign bcd1 = bcd1_reg;
	assign bcd2	= bcd2_reg;
	assign bcd3 = bcd3_reg;
always
ajksdhjas
asdlkaslkdkashjsagd
asdjhsa

  	
endmodule
