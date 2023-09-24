@echo off
cls

SET PATH=D:\assembler\lab_10\Masm32\bin
SET INCLUDE=D:\assembler\lab_10\Masm32\INCLUDE
SET LIB=D:\assembler\lab_10\Masm32\LIB

Rc.exe /v %1.rc

ML /nologo -c -coff %1.asm
if errorlevel 1 goto terminate

LINK /nologo %1.obj %1.res /SUBSYSTEM:WINDOWS

if errorLevel 1 goto terminate

echo OK

:terminate