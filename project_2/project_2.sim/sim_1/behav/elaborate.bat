@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto a2b42fd2003a4d12abe8512e24c1697c -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot d_edge_detector_test_behav xil_defaultlib.d_edge_detector_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
