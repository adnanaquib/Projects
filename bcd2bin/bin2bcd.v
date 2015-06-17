`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:35:20 06/08/2015 
// Design Name: 
// Module Name:    bin2bcd 
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
 module bcd2bin
#(parameter W = 14)
(

		input wire clk, reset,
		input wire start,
		input wire [3:0] bcd0, bcd1, bcd2, bcd3,
		output reg ready, done_tick,
		output wire [W-1:0] bin
    );


localparam [1:0]
	idle = 2'b00,
	op = 2'b01,
	done = 2'b10,
	waits = 2'b11;



reg [1:0] state_reg, state_next;
reg [3:0] bcd0_reg, bcd1_reg, bcd2_reg, bcd3_reg;
reg [3:0] bcd0_next, bcd1_next, bcd2_next, bcd3_next;
reg [W-1:0]bin_temp, bin_next;
reg [3:0] n_reg, n_next; 
wire [3:0] bcd3_temp, bcd2_temp, bcd1_temp, bcd0_temp;
reg [26:0] ms_reg, ms_next;



//reg ticker;
always @(posedge clk, posedge reset)
if(reset)
begin 
	state_reg <= 0;
	bcd0_reg<= 0;
	bcd1_reg <= 0;
	bcd2_reg <= 0;
	bcd3_reg <= 0;
	bin_temp <= 0;
	n_reg <= 0;
	ms_reg <= 0;
end 

else 
	begin 
		state_reg <= state_next;
		bcd0_reg	<= bcd0_next;
		bcd1_reg <= bcd1_next;
		bcd2_reg <= bcd2_next;
		bcd3_reg <= bcd3_next;
		n_reg <= n_next;
		bin_temp <= bin_next;
		ms_reg <= ms_next;
	end 
	

always @ *
	begin 
		state_next = state_reg;
		n_next = n_reg;
		bin_next = bin_temp;
		bcd0_next = bcd0_reg;
      bcd1_next = bcd1_reg;
      bcd2_next = bcd2_reg;
      bcd3_next = bcd3_reg;
		ms_next = ms_reg;
		
		case (state_reg)
			idle:
				begin 
					ready = 1'b1;
						if (start)
							begin
								state_next = op;
								bcd3_next = bcd3;
								bcd2_next = bcd2;
								bcd1_next = bcd1;
								bcd0_next = bcd0;
								ms_next = 0;
								n_next = 4'b1110;
								//bcd_temp = {bcd3,bcd2,bcd1,bcd0} ;
								bin_next = {13'b0};
								state_next = op;
							end 
				end
			op: 
				begin
						 
                                                    
				    if(n_reg == 4'b1110)
				      begin
					   bin_next = {bcd0_reg[0], bin_next[W-1:1]};
					   bcd0_next = {bcd1_reg[0],bcd0_reg[3:1]};
                       bcd1_next = {bcd2_reg[0],bcd1_reg[3:1]};
                       bcd2_next = {bcd3_reg[0],bcd2_reg[3:1]};
                       bcd3_next = bcd3_reg >> 1;
                       end
                      
					else //if(bcd0_reg < 5)
					   begin
					     bin_next = {bcd0_temp[0], bin_next[W-1:1]};
                         bcd0_next = {bcd1_temp[0],bcd0_temp[3:1]};
                         bcd1_next = {bcd2_temp[0],bcd1_temp[3:1]};
                         bcd2_next = {bcd3_temp[0],bcd2_temp[3:1]};
                         bcd3_next = bcd3_temp >> 1;
                        end
                        
					/*
					//ticker = 1'b1;*/
					n_next = n_reg - 1;
					//$display (" bcd0_next = %d", bcd0_next);
					if(n_next == 0)
						state_next = done;
				
				end 
				
			
			done:
				begin 
					done_tick = 1'b1;
					state_next = waits;
				end
				
			waits:
				begin 
					done_tick = 1'b1;
					ms_next = ms_reg + 1;
					if(ms_next[26] == 1)
					begin 
						ms_next = 0;
						state_next = idle;
					end 
				end
			default: state_next = idle;
		
		endcase 
					
					

					
	end 	
						  assign bcd0_temp = (bcd0_reg > 4 ) ? bcd0_reg - 3:bcd0_reg;            
                    assign bcd1_temp = (bcd1_reg > 4) ? bcd1_reg - 3: bcd1_reg;
                    assign bcd2_temp = (bcd2_reg > 4) ? bcd2_reg - 3: bcd2_reg;
                    assign bcd3_temp = (bcd2_reg > 4) ? bcd3_reg - 3: bcd3_reg;    
						  assign bin = bin_temp;
endmodule
