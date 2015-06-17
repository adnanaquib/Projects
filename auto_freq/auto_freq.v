`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:41:55 06/13/2015 
// Design Name: 
// Module Name:    auto_freq 
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
module auto_freq(
	input wire clk, reset,
	input wire start , si,
	output wire [3:0] bcd3, bcd2, bcd1, bcd0
    );
	 
	 
	 localparam [1:0]
					idle = 2'b00,
					count = 2'b01,
					frq = 2'b10,
					b2b = 2'b11;
	
	reg [1:0] state_reg, state_next;
	wire [9:0] prd;
	wire [19:0] dvsr, dvnd, quo;
	reg prd_start, div_start, b2b_start;
	wire prd_done_tick, div_done_tick, b2b_done_tick;
	
	
	
	
	// Instantiate stuff
	
	
	period_counter prd_count_unit
	(
		.clk(clk), .reset(reset), .start(prd_start), .si(si),
		.ready(ready), .done_tick(prd_done_tick), .prd(prd)
	);
	
	div #(.W(20), .CBIT(5)) div_unit 
	(
	.clk(clk), .reset(reset), .start(div_start),
	.dvsr(dvsr), .dvnd(dvnd), .quo(quo), .rmd(), .ready(), .done_tick(div_done_tick)
		
	);
	
	
	bin2bcd bin2bcd1
(
		.clk(clk), .reset(reset),
		.start(b2b_start),
		.bin(quo[12:0]),
		.bcd3(bcd3), .bcd2(bcd2), .bcd1(bcd1), .bcd0(bcd0),
		.ready(), .done_tick(b2b_done_tick)
 );
	
	
	
	
	
	
	
	
	
	
	//FSM 
	
	always @(posedge clk, posedge reset)
		if(reset)
			state_reg <= idle;
		else 
			state_reg <= state_next;
			
			
	
	always @ * 
	begin 
		state_next = state_reg;
		prd_start = 1'b0;
		div_start = 1'b0;
		b2b_start = 1'b0;
		
		case (state_reg)
			idle:
				if(start)
					begin 
						prd_start = 1'b1;
						state_next = count;
					end 
			count:
				if(prd_done_tick)
					begin 
						div_start = 1'b1;
						state_next = frq;
					end 
			frq:
				if(div_done_tick)
					begin 
						b2b_start = 1'b1;
						state_next = b2b;
					end 
			
			b2b:
				if(b2b_done_tick)
					state_next = idle;
		endcase 
	end
endmodule 

	

