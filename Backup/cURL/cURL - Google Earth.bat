@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.  
@echo                 Dang Cai Dat %SOFTNAME%. Vui Long Cho
@echo off
pushd "%~dp0"
:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Set Admin License Soft File Process Name User Agent
set "Admin="
set "License="
set "SOFTNAME=Google Earth"
set "FILENAME=Google Earth-HieuckIT.exe"
set "PROCESS=googleearth.exe"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Set code based on Windows Architecture
if %ARCH%==x86 (
	echo Notice: This software is only compatible with Windows 64-bit operating systems. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
		)
	exit
)
set "LINK=https://dl.google.com/tag/s/appguid%3D%7B65E60E95-0DE9-43FF-9F3F-4F7D2DFF04B5%7D%26iid%3D%7B65E60E95-0DE9-43FF-9F3F-4F7D2DFF04B5%7D%26lang%3Dvi%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Earth%2520Pro%26needsadmin%3DTrue%26brand%3DGGGE/earth/client/GoogleEarthProSetup.exe"
set "QUIETMODE="
set "CR4CKFILE=danvaoday.rar"
set "CR4CKLINK=danvaoday"
set "SOFTPATH=%PROGRAMFILES%\Google\Google Earth Pro\client"
set "SOFTLOCATION=%SOFTPATH%\%PROCESS%"

:: Check if Command Prompt is running with administrator privileges
net session >nul 2>&1
if %errorlevel% == 0 (
	echo Command Prompt is running as Administrator.
) else (
	if "%Admin%"=="Yes" (
		echo Please Run as Administrator. Exiting in 3 seconds...
		for /l %%i in (3,-1,1) do (
			echo Exiting in %%i seconds...
			timeout /t 1 /nobreak >nul
		)
		exit
	) else (
		echo Warning: This program may not function correctly without administrator privileges.
		for /l %%i in (3,-1,1) do (
			echo Starting in %%i seconds...
			timeout /t 1 /nobreak >nul
		)
	)
)

:: Terminate the %SOFTNAME% Process
tasklist | find /i "%PROCESS%" > nul
if %errorlevel% equ 0 (
	taskkill /im "%PROCESS%" /f
)

:: Download
@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.  
@echo                 Dang Cai Dat %SOFTNAME%. Vui Long Cho
@echo off
pushd "%~dp0"
echo Downloading %SOFTNAME%...
curl -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK%" --insecure

if not exist "%FILENAME%" (
	echo Download %SOFTNAME% failed.
	echo Please check your network connection. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

:: Install
@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.  
@echo                 Dang Cai Dat %SOFTNAME%. Vui Long Cho
@echo off
pushd "%~dp0"
echo Installing %SOFTNAME%...
"%FILENAME%" %QUIETMODE%

:: Check Installation Process
echo Checking if %SOFTNAME% installation is complete...
setlocal EnableDelayedExpansion
set count=0
:waitloop
timeout /t 1 /nobreak > nul
set /a count+=1
if exist "%SOFTLOCATION%" goto installed
if !count! equ 30 goto timeout
goto waitloop
:timeout
echo Timeout: %SOFTNAME% installation has not completed in 30 seconds.
goto end
:installed
echo %SOFTNAME% has been installed successfully!
timeout /t 3
:end
)

:: License
if "%License%"=="Yes" (
	echo Cr4cking %SOFTNAME%...
	curl -L --max-redirs 20 -A "%USERAGENT%" -o "%CR4CKFILE%" "%CR4CKLINK%" --insecure
	if exist "%CR4CKFILE%" (
		move /y "%CR4CKFILE%" "%SOFTPATH%"
	) else (
		echo Please try running the script as Administrator.
	)
	if exist "%SOFTPATH%\%CR4CKFILE%" (
		"%PROGRAMFILES%\WinRAR\UnRAR.exe" e -p123 /y "%SOFTPATH%\%CR4CKFILE%" "%SOFTPATH%"
		echo Successfully Cr4cked %SOFTNAME%.
		del "%SOFTPATH%\%CR4CKFILE%"
	) else (
		echo Cr4cking %SOFTNAME% failed.
		echo Please try running the script as Administrator.
	)
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 3 seconds.
for /l %%i in (3,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
	if exist "%FILENAME%" (
		tasklist | find /i "%FILENAME%" > nul
		if %errorlevel% equ 0 (
			taskkill /im "%FILENAME%" /f
		)
	del "%FILENAME%"
	)
)
echo Please close the script manually if automatically close fails.
popd