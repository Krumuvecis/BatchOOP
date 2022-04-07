@echo off

REM Initialize variables.
:initialize
set iniFileName=initest.ini
goto start


REM Script is supposed to start here.
:start
REM cls
echo Are you ready?
echo.
pause
cls
call :read
cls
call :write
goto end


REM Read from ini
:read
set keyName=myKey
echo Reading %keyName% from %iniFileName%
call iniread.bat %iniFileName% %keyName% value
echo.
echo Value: %value%

call :finishMessage
goto :eof


REM Write to ini
:write
echo Writing to ini
echo.

set iniWriteFileName=iniwrite.bat
call %iniWriteFileName%

call :finishMessage
goto :eof


:finishMessage
echo.
echo Done.
echo.
pause
goto :eof


:end
exit