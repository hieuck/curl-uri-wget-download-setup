@echo off
pushd "%~dp0"

REM Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

rem Use '!' instead of '%' for variable names.
setlocal EnableDelayedExpansion

setlocal EnableExtensions

rem
rem If we fail, look in the current directory.
rem
set CAPCUT_DIR="%LocalAppData%\CapCut"
set JIANYINGPRO_DIR="%LocalAppData%\JianyingPro\Apps"

rem Sort CAPCUT_DIR's subdirectories (/a:d) by reverse date (/o:-d) of
rem creation (/t:c) and find the first one that contains the exe.
for /f "usebackq" %%A in  (`dir "%%CAPCUT_DIR%%\*" /a:d /o:-d /t:c /b`) do (
	set LANG_CAPCUT_PATH=!CAPCUT_DIR!\%%A\Resources\po\vi-VN.po
	if exist "!LANG_CAPCUT_PATH!" (goto :JIANYINGPRO_GET_VER)
)

:JIANYINGPRO_GET_VER
rem Sort JIANYINGPRO_DIR's subdirectories (/a:d) by reverse date (/o:-d) of
rem creation (/t:c) and find the first one that contains the exe.
for /f "usebackq" %%A in  (`dir "%%JIANYINGPRO_DIR%%\*" /a:d /o:-d /t:c /b`) do (
	set LANG_JIANYINGPRO_PATH=!JIANYINGPRO_DIR!\%%A\Resources\po\zh-Hans.po
	if exist "!LANG_JIANYINGPRO_PATH!" (goto :RUN_IT)
)

:FAIL
@echo Fatal error: Can't find language file. Please check the installation path.
pause
exit /b 1

:RUN_IT
@echo Found CapCut path: !LANG_CAPCUT_PATH!
@echo Found JianyingPro path: !LANG_JIANYINGPRO_PATH!
echo.
xcopy !LANG_JIANYINGPRO_PATH! "zh-Hans.po.bak" /I /E /Y
xcopy !LANG_CAPCUT_PATH! !LANG_JIANYINGPRO_PATH! /I /E /Y
@echo.
@echo Completed.
@echo The script will automatically close in 3 seconds.
for /l %%i in (3,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
)
exit /b 0