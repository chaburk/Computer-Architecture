@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim alu_tb_behav -key {Behavioral:sim_1:Functional:alu_tb} -tclbatch alu_tb.tcl -view C:/Users/e190a104/Desktop/HW06_MIPS_ALU_Solution_Fall2018/simulation_sources/alu_wave.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
