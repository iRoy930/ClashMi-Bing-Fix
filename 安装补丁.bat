@echo off
setlocal
title Clash Mi Bing Fix v2.0.0

set "SCRIPT=%~dp0bing-rule-fix.js"

if not exist "%SCRIPT%" (
    echo.
    echo ERROR: bing-rule-fix.js was not found.
    echo.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Clash Mi Bing Fix v2.0.0
echo ==========================================
echo.
echo This package uses the JS file as the actual patch.
echo This helper only prepares the file for import.
echo.
echo Opening the JS file...
start "" notepad.exe "%SCRIPT%"

echo.
echo In Clash Mi:
echo   Core Settings - Override - Add Override - JS
echo.
echo Import bing-rule-fix.js and enable the override.
echo If available, set Append Override to Built-in Override.
echo.
echo IMPORTANT:
echo This helper does not change Clash Mi internal files.
echo No subscription URL or private configuration is read.
echo.
pause
