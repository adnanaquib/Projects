@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xsim bcd2bin_test_behav -key {Behavioral:sim_1:Functional:bcd2bin_test} -tclbatch bcd2bin_test.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
