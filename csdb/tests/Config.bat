@echo off
rem Configures build tree for Code Snippets Demos and Tests
rem $Rev: 81 $
rem $Date: 2014-03-01 00:43:03 +0000 (Sat, 01 Mar 2014) $

setlocal

cd ..

rem create binary intermediate file output directories (one per sub-project)
if not exist Bin mkdir Bin
if not exist Bin\Cat-Hex mkdir Bin\Cat-Hex
if not exist Bin\Cat-Drive mkdir Bin\Cat-Drive
if not exist Bin\Cat-WinSys mkdir Bin\Cat-WinSys
if not exist Bin\Cat-Date mkdir Bin\Cat-Date
if not exist Bin\Cat-Maths mkdir Bin\Cat-Maths
if not exist Bin\Cat-String mkdir Bin\Cat-String
if not exist Bin\Cat-Arrays mkdir Bin\Cat-Arrays
if not exist Bin\Cat-Structs mkdir Bin\Cat-Structs

rem create executable output directory (shared between all sub-projects)
if not exist Exe mkdir Exe

endlocal
