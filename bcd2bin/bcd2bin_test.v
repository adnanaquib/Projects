`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:33 06/08/2015 
// Design Name: 
// Module Name:    bcd2bin_test 
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
module bcd2bin_test();


localparam T = 20;

reg clk, out;
wire [13:0] bin;

always 
begin
clk = 1'b1;

#(T/2);

clk = 1'b0;

#(T/2);

end 


initial 
begin 
#20000;
$stop;
end 






bcd2bin #(.W(14)) new_test
(

		.clk(clk), .reset(1'b0),
		.start(1'b1),
		.bcd0(4'b1001), .bcd1(4'b0001), .bcd2(4'b0000), .bcd3(4'b0),
		.ready(), .done_tick(),
		.bin(bin)
 );

endmodule
