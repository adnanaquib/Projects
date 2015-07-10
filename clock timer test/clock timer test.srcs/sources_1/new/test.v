`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2015 04:02:26 PM
// Design Name: 
// Module Name: test
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


module test(
    );
  
wire clk, start_clock, stop_clock;
wire [3:0] btn;

localparam T = 20;



    
    
   
    	clock_timer_stopwatch counter_unit
        (
            .clk(clk), .start(start_clock), .clr(btn[0]), .d2(), .d1(), .d0(),
            .stop(stop_clock)
        );
        
 always
        begin
        clk = 1'b1;
        
        # (T/2);
        
        
        clk = 1'b0;
        
        end        
endmodule
