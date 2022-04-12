REM Sets key-value pair
REM call addPair [file name] [key] [value]
set delim==
set line=%~2%delim%%~3
echo %line%>> %~1
goto :eof