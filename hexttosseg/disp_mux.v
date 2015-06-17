`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:26 06/02/2015 
// Design Name: 
// Module Name:    disp_mux 
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
module disp_mux(

input wire clk, reset,
input [7:0] in3, in2 , in1 , in0,
output reg [3:0] an,
output reg [7:0] sseg
    );


localparam N = 18;

reg [N-1:0] q_reg;

wire [N-1:0] q_next;


always @(posedge clk, posedge reset)
if (reset )
q_reg <= 0;
else 
q_reg <= q_next;

assign q_next = q_reg + 1;


always @ *
case (q_reg[N-1:N-2])
2'b00:
	begin 
		an = 4'b1110;
		sseg = in0;
	end
2'b01:
		begin 
		an = 4'b1101;
		sseg = in2;
		end 
2'b10:
	begin 
		an = 4'b1011;
		sseg = in3;
	end
default:
	begin 
		an = 4'b0111;
		sseg = in3;
	end
endcase

endmodule	
