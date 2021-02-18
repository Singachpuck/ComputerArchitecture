@ECHO OFF
REM 1 Assembling
CLS
TASM /L LAB1_\names.asm
IF ERRORLEVEL 1 GOTO exit
REM PAUSE

REM 1 Linking
TLINK names.obj
IF ERRORLEVEL 1 GOTO exit

names.exe
:exit
ECHO ON
