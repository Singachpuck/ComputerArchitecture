@ECHO OFF
REM 1 Assembling
CLS
TASM lab5.asm
IF ERRORLEVEL 1 GOTO exit
REM PAUSE

REM 1 Linking
TLINK lab5.obj
IF ERRORLEVEL 1 GOTO exit

lab5.exe
:exit
ECHO ON