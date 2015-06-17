`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:49:31 06/10/2015 
// Design Name: 
// Module Name:    fib_test 
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
module fib_test(
			input wire clk,
			//input wire [3:0]bcd0, bcd1,
			output wire [6:0] sseg,
			output wire [3:0] an

    );

wire fib_done;

//wire [19:0] bin;
wire [19:0] bin_fib;
wire [19:0] bin_fib_out;
wire [3:0] hex0, hex1, hex2, hex3;


/*wire m_clk;
wire [3:0] m_bcd0, m_bcd1;
wire m_fib_done;
wire m_bcd2bin_done_entry;
*/

 bcd2bin bcd2bin
(

		.clk(clk), .reset(1'b0),
		.start(1'b1),
		.bin(bin_fib),// o/p
		.bcd3(4'b0), .bcd2(4'b0), .bcd1(4'b0010), .bcd0(4'b0001), //  i/p
		.ready(), .done_tick()
 );
 

 
 //assign m_bcd2bin_done_entry = bcd2bin_done_entry;
 
 
 fib fib_enter
(
	.clk(clk), .reset(1'b0),
	.i(bin_fib),
	.start(1'b1), 
	.ready(), .done_tick(fib_done),
	.f(bin_fib_out)

);
//assign m_fib_done = fib_done;
bin2bcd bin2bcd
(

		.clk(clk), .reset(1'b0),
		.start(fib_done),
		.bcd0(hex0), .bcd1(hex1), .bcd2(hex2), .bcd3(hex3), //op
		.ready(), .done_tick(),
		.bin(bin_fib_out) // ip
 );
 


// Maybe implement done tick for MUX 
//also add UCF file 

disp_hex_mux disp_unit
	 (	
		.clk(clk), .reset(1'b0), .hex3(hex3), .hex2(hex2), .hex1(hex1), .hex0(hex0),
		.dp_in(4'b1011), .an(an), .sseg(sseg)
	 );
		
/*assign m_clk = clk;
assign m_bcd0 = bcd0;
assign m_bcd1 = bcd1;
	*/	
		
endmodule
