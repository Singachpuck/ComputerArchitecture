@ECHO OFF
REM 1 Assembling
CLS
TASM lab3.asm
IF ERRORLEVEL 1 GOTO exit
REM PAUSE

REM 1 Linking
TLINK lab3.obj
IF ERRORLEVEL 1 GOTO exit

lab3.exe
:exit
ECHO ON