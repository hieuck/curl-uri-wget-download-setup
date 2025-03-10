@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=15
@cls
echo.
echo.
echo.
@echo     Бл          ллл   ллл ллл лллллл ллл   ллл  ллллл  ллл  лл ллл ллллллллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo        Вл       ллллллллл ллл лллллл ллл   ллл ллл     ллллл   ллл    ллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo     Бл   ВВВВВ  ллл   ллл ллл лллллл ллллллллл  ллллл  ллл  лл ллл    ллл В
@echo.  
@echo                 Dang Cai Dat EVKey. Vui Long Cho
@echo off
@echo off
REM Copy EVKey to Program Files
robocopy "%~dp0\EVKey" "%ProgramFiles%\EVKey" /E /MIR /R:0 /W:0

REM Check 32-bit or 64-bit
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set "TargetFile=%ProgramFiles%\EVKey\EVKey32.exe"
) else (
    set "TargetFile=%ProgramFiles%\EVKey\EVKey64.exe"
)

set "ShortcutName=EVKey.lnk"
set "ShortcutPath=%PUBLIC%\Desktop\%ShortcutName%"

REM Shortcut
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%ShortcutPath%" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%TargetFile%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs