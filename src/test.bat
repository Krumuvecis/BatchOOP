@echo off

REM Initialize variables.
:initialize
set iniFileName=initest.ini


REM Script is supposed to start here.
:start
REM cls
echo Are you ready?
echo.
pause


REM Read from ini
:read
cls
echo Reading from ini
echo.

set iniReadFileName=iniread.bat
call %iniReadFileName%

echo.
echo Done.
echo.
pause


REM Write to ini
:write
cls
echo Writing to ini
echo.

set iniWriteFileName=iniwrite.bat
call %iniWriteFileName%

echo.
echo Done.
echo.
pause


exit