REM call iniread.bat [file name] [key name] [output value]

set fileName=%~1
set keyName=%~2

REM delimiter
set delim==

REM Returns 2nd token separated by delim as 2nd parameter.
for /f "tokens=2 delims=%delim%" %%a in ('find "%keyName%%delim%" %fileName%') do set %~3=%%a

goto :eof