set delim==
set iniWriteFile=iniwrite.ini

set key1=myKey1
set key2=myKey2
set value1=myValue1
set value2=myValue2

call :create
call :addPair %key1% %value1%
call :addPair %key2% %value2%
goto :eof


:create
del %iniWriteFile%
echo.> %iniWriteFile%
goto :eof


:addPair
set line=%~1%delim%%~2
echo %line%>> %iniWriteFile%
goto :eof