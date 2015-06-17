`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:46 06/06/2015 
// Design Name: 
// Module Name:    d_edge_detector_test 
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
module d_edge_detector_test(
    );
	 

reg clk, reset, level;
wire tick_1, tick_0, counter;

localparam T = 20;

d_edge_detector m1(.clk(clk), .reset(reset), .level(level), .tick_1(tick_1), .tick_0(tick_0), .counter(counter)  );

always 
begin 	 
clk = 1'b1;

#(T/5);


clk = 1'b0;

#(T/5);

end 

always 
begin 
level = 1'b1;
#T;
level = 1'b0;
#T;

end 

initial 
begin 
# 20000;
$stop;
end


endmodule
