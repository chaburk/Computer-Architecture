@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim cu_tb_behav -key {Behavioral:sim_1:Functional:cu_tb} -tclbatch cu_tb.tcl -view C:/Users/e190a104/Desktop/HW09_MIPS_CU_Solution/simulation_sources/cu_wave.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
