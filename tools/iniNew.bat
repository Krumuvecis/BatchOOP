REM Creates a new blank file with the specified name
REM call iniNew.bat [file name]
set fileName=%~1
if exist %fileName% del %fileName%
echo.> %fileName%
goto :eof