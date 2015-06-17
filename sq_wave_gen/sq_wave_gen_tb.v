`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:12 06/03/2015 
// Design Name: 
// Module Name:    sq_wave_gen_tb 
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
module sq_wave_gen_tb();


reg clock;
localparam T = 20;
wire gen;



always
begin
clock = 1'b1;

#(T/2)

clock = 1'b0;
end 




sq_wave_gen #(.N(4)) new_instance 

(
	 .clk(clk), .reset(1'b0),  .gen(gen)    //, .m_ctrl(4'b0001), .n_ctrl(4'b0001),

);


endmodule
