@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto fb7b3e6532f7459e879d99227325f362 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot bcd2bin_test_behav xil_defaultlib.bcd2bin_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
