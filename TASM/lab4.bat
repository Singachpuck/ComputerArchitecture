@ECHO OFF
REM 1 Assembling
CLS
TASM lab4.asm
IF ERRORLEVEL 1 GOTO exit
REM PAUSE

REM 1 Linking
TLINK lab4.obj
IF ERRORLEVEL 1 GOTO exit

lab4.exe
:exit
ECHO ON
