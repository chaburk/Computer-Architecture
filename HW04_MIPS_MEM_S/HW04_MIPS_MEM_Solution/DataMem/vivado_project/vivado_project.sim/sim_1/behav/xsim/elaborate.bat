@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Tue Mar 02 12:31:48 -0600 2021
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto 930e6c2f004847869aaa721336677540 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot DataMem_tb_behav xil_defaultlib.DataMem_tb -log elaborate.log"
call xelab  -wto 930e6c2f004847869aaa721336677540 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot DataMem_tb_behav xil_defaultlib.DataMem_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0