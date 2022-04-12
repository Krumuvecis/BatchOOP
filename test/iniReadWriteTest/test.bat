REM Order of this test:
REM 	1. Initialize.
REM 	2. Write to .ini.
REM 	3. Read from .ini.
REM 	4. Compare written and read values.

REM Initialize variables.
:initialize
@echo off
call :set_dirs
call :set_fileNames
call :set_vars
goto start


REM Sets paths for the directories used.
REM call :set_dirs
:set_dirs
set rootDir=..\..
set toolsDir=tools
goto :eof


REM Sets names for the files used.
REM call :set_fileNames
:set_fileNames
set iniName=test.ini
goto :eof


REM Sets variables for reading and writing.
REM call :set_vars
:set_vars
set key1=myKey1
set key2=myKey2
set writeValue1=myValue1
set writeValue2=myValue2
set readValue1=
set readValue2=
goto :eof


REM Script is supposed to start here.
REM Go here when initialization has completed.
:start
cls
echo Testing reading and writing of .ini files.
echo Are you ready?
echo.
pause
call :write
call :read
call :compare
goto end


REM Write to .ini.
REM call :write
:write
cls
echo Writing to ini.
echo.
call %rootDir%\%toolsDir%\iniNew.bat %iniName%
call :write_single %key1% %writeValue1%
call :write_single %key2% %writeValue2%
call footer.bat
goto :eof


REM Writes a single key-value pair to .ini.
REM call :write_single [key] [value]
:write_single
set key=%~1
set value=%~2
echo Writing "%key%=%value%" to %iniName%
call %rootDir%\%toolsDir%\iniAdd.bat %iniName% %key% %value%
goto :eof


REM Read from .ini.
REM call :read
:read
cls
echo Reading from %iniName%
echo.
call :read_single %key1% readValue1
call :read_single %key2% readValue2
call footer.bat
goto :eof


REM Reads a single line from .ini.
REM call :read_single [key] [read value output]
:read_single
set keyName=%~1
echo Looking for %keyName%
call %rootDir%\%toolsDir%\iniRead.bat %iniName% %keyName% readValue
echo Read value: %readValue%
set %~2=%readValue%
goto :eof


REM Compare written and read values.
REM call :compare
:compare
cls
echo Comparing values.
echo.
call :compare_single %writeValue1% %readValue1%
call :compare_single %writeValue2% %readValue2%
call footer.bat
goto :eof


REM Compare a single pair of written-read values.
REM call :compare_single [written value] [read value]
:compare_single
set writeValue=%~1
set readValue=%~2
echo Written: %writeValue%, read: %readValue%
if %readValue%==%writeValue% (echo OK) else (echo Values are not equal!)
goto :eof


REM Exits program.
:end
call :cleanup
exit


REM Remove temporary files.
REM call :cleanup
:cleanup
if exist %iniName% del %iniName%
goto :eof