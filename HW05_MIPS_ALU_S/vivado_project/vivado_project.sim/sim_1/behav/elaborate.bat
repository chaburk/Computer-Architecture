@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 747f2b14231f4c8e85de9efc176dce3b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot alu_tb_behav xil_defaultlib.alu_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
