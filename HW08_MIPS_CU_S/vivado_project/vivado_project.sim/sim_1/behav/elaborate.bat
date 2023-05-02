@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 1bec7975d4fa4f71997d8248aa5b5eb4 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot cu_tb_behav xil_defaultlib.cu_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
