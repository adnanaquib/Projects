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
  
reg clk;
reg start_clock, stop_clock;
wire [3:0] d0, d1, d2;
reg clr;
localparam T = 20;


always
        begin
        clk = 1'b1;
        # (T/2);
        clk = 1'b0;
        # (T/2);
        end
    
    
   
    	clock_timer_stopwatch counter_unit
        (
            .clk(clk), .start(start_clock), .clr(clr), .d2(d2), .d1(d1), .d0(d0),
            .stop(stop_clock)
        );
        
 
    
    
initial 
    begin 
    #T
    clr = 1'b1;
    #T
    clr = 1'b0;
    # T;
    start_clock = 1'b1;
    # (T*10);
    start_clock = 1'b0;
    
    # 30000000;
    stop_clock = 1'b1;
    #(T*4);
    
    stop_clock = 1'b0;
    
    $stop;
    
    end
                
endmodule
