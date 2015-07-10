# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xcku035-fbva676-1-c

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/Xilinx/Projects/project_4/project_4.cache/wt [current_project]
set_property parent.project_path D:/Xilinx/Projects/project_4/project_4.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  D:/Xilinx/Projects/project_4/project_4.srcs/sources_1/new/clock_timer.v
  D:/Xilinx/Projects/project_4/project_4.srcs/sources_1/new/test.v
}
synth_design -top test -part xcku035-fbva676-1-c
write_checkpoint -noxdef test.dcp
catch { report_utilization -file test_utilization_synth.rpt -pb test_utilization_synth.pb }
