////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: rot_led_banner_test_synthesis.v
// /___/   /\     Timestamp: Thu Jun 04 03:51:27 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim rot_led_banner_test.ngc rot_led_banner_test_synthesis.v 
// Device	: xc3s100e-4-cp132
// Input file	: rot_led_banner_test.ngc
// Output file	: D:\Xilinx\Projects\rot_led_banner\netgen\synthesis\rot_led_banner_test_synthesis.v
// # of Modules	: 1
// Design Name	: rot_led_banner_test
// Xilinx        : D:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module rot_led_banner_test (
  clk, dir, en, an, sseg
);
  input clk;
  input dir;
  input en;
  output [3 : 0] an;
  output [6 : 0] sseg;
  wire N0;
  wire N1;
  wire an_0_OBUF_6;
  wire an_1_OBUF_7;
  wire an_2_OBUF_8;
  wire an_3_OBUF_9;
  wire clk_BUFGP_14;
  wire [3 : 3] \banner_work_pls/Result ;
  wire [3 : 2] \banner_work_pls/data_access ;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FD   \banner_work_pls/data_access_3  (
    .C(clk_BUFGP_14),
    .D(\banner_work_pls/Result [3]),
    .Q(\banner_work_pls/data_access [3])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \banner_work_pls/an_mux0000<3>1  (
    .I0(\banner_work_pls/data_access [3]),
    .I1(\banner_work_pls/data_access [2]),
    .O(an_3_OBUF_9)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \banner_work_pls/an_mux0000<2>1  (
    .I0(\banner_work_pls/data_access [2]),
    .I1(\banner_work_pls/data_access [3]),
    .O(an_2_OBUF_8)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \banner_work_pls/an_mux0000<1>1  (
    .I0(\banner_work_pls/data_access [3]),
    .I1(\banner_work_pls/data_access [2]),
    .O(an_1_OBUF_7)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \banner_work_pls/an_mux0000<0>1  (
    .I0(\banner_work_pls/data_access [2]),
    .I1(\banner_work_pls/data_access [3]),
    .O(an_0_OBUF_6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \banner_work_pls/Maccum_data_access_xor<3>11  (
    .I0(\banner_work_pls/data_access [3]),
    .I1(\banner_work_pls/data_access [2]),
    .O(\banner_work_pls/Result [3])
  );
  OBUF   an_3_OBUF (
    .I(an_3_OBUF_9),
    .O(an[3])
  );
  OBUF   an_2_OBUF (
    .I(an_2_OBUF_8),
    .O(an[2])
  );
  OBUF   an_1_OBUF (
    .I(an_1_OBUF_7),
    .O(an[1])
  );
  OBUF   an_0_OBUF (
    .I(an_0_OBUF_6),
    .O(an[0])
  );
  OBUF   sseg_6_OBUF (
    .I(N0),
    .O(sseg[6])
  );
  OBUF   sseg_5_OBUF (
    .I(N0),
    .O(sseg[5])
  );
  OBUF   sseg_4_OBUF (
    .I(N0),
    .O(sseg[4])
  );
  OBUF   sseg_3_OBUF (
    .I(N0),
    .O(sseg[3])
  );
  OBUF   sseg_2_OBUF (
    .I(N0),
    .O(sseg[2])
  );
  OBUF   sseg_1_OBUF (
    .I(N0),
    .O(sseg[1])
  );
  OBUF   sseg_0_OBUF (
    .I(N1),
    .O(sseg[0])
  );
  FDR   \banner_work_pls/data_access_2  (
    .C(clk_BUFGP_14),
    .D(N1),
    .R(\banner_work_pls/data_access [2]),
    .Q(\banner_work_pls/data_access [2])
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_14)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

