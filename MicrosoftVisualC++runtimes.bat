::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::																								::
::							https://linktr.ee/hieuckit											::
::		Github:				https://github.com/hieuck/curl-uri-wget-download-setup				::
::		Facebook:			https://www.facebook.com/ZzhieuhuhongzZ/							::
::		Donate to me:		Vietcombank - 9966595263 - LE TRUNG HIEU							::
::																								::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

title _Hieuck.IT_'s Windows Application Setting Up...
color 0B
mode con:cols=100 lines=17
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Cau Hinh %SOFTNAME%. Vui Long Cho...
@echo off
pushd "%~dp0"
:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Set License Extract7z Soft Process Name CheckOSVersion User Agent
set "License="
set "Extract7z="
set "SOFTNAME=Microsoft Visual C++ runtimes"
set "PROCESS=danvaoday.exe"
set "CheckOSVersion=No"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Set code based on Windows Architecture
:: Source link: 

set "vc2005=https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
set "vc2008=https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
set "vc2010=https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
set "vc2012=https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
set "vc2013=https://download.visualstudio.microsoft.com/download/pr/10912113/5da66ddebb0ad32ebd4b922fd82e8e25/vcredist_x86.exe"
set "vc2015=https://aka.ms/vs/17/release/vc_redist.x86.exe"
set "vc2005x64=https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
set "vc2008x64=https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"
set "vc2010x64=https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe"
set "vc2012x64=https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
set "vc2013x64=https://download.visualstudio.microsoft.com/download/pr/10912041/cee5d6bca2ddbcd039da727bf4acb48a/vcredist_x64.exe"
set "vc2015x64=https://aka.ms/vs/17/release/vc_redist.x64.exe"

:: Create download folder
set "download_folder=%~dp0\vc_redist"
md "%download_folder%" 2>NUL

:: Set up information related to software cr4cking
if "%License%"=="Yes" (
	set "Admin=Yes"
	set "CR4CKFILE=danvaoday"
	set "CR4CKPATH=%SOFTPATH%"
	set "CR4CKLINK=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Cr4ck/!CR4CKFILE!.rar"
	set "LINK7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "LINK7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
)

::Extract with 7z
if "%Extract7z%"=="Yes" (
	set "FILENAME=%SOFTNAME%-HieuckIT.zip"
	set "Admin=Yes"
	set "Shortcut=Yes"
	set "SOFTPATH=%PROGRAMFILES%\%SOFTNAME%"
	set "LINK7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "LINK7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
) else (
	set "Shortcut=No"
	set "FILENAME=%SOFTNAME%-HieuckIT.exe "
)
set "SOFTLOCATION=%SOFTPATH%\%PROCESS%"

::Check Windows OS Version
if /i "%CheckOSVersion%"=="no" (
	goto SkipCheckOSVersion
)

setlocal EnableDelayedExpansion
for /f "tokens=4 delims=[.] " %%i in ('ver') do (
	set "version1=%%i"
)

for /f "tokens=5 delims=[.] " %%i in ('ver') do (
	set "version2=%%i"
)
set "version=%version1%.%version2%"

if "%version%"=="6.1" (
	echo Sorry, this software is not compatible with Windows 7. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)
endlocal

:SkipCheckOSVersion

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

:: Save the value of the %time% variable before running the batch script
set start_time=%time%

:: Download
@ECHO OFF
title _Hieuck.IT_'s Windows Application Downloading...
color 0B
mode con:cols=100 lines=17
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Tai %SOFTNAME%. Vui Long Cho...
@echo off
pushd "%~dp0"
echo Downloading %SOFTNAME%...
if exist "wget.exe" (
	if %ARCH%==X86 (
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2005_x86.exe" -U "%USERAGENT%" "%vc2005%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2008_x86.exe" -U "%USERAGENT%" "%vc2008%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2010_x86.exe" -U "%USERAGENT%" "%vc2010%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2012_x86.exe" -U "%USERAGENT%" "%vc2012%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2013_x86.exe" -U "%USERAGENT%" "%vc2013%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2015_x86.exe" -U "%USERAGENT%" "%vc2015%"
	) else (
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2005_x86.exe" -U "%USERAGENT%" "%vc2005%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2008_x86.exe" -U "%USERAGENT%" "%vc2008%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2010_x86.exe" -U "%USERAGENT%" "%vc2010%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2012_x86.exe" -U "%USERAGENT%" "%vc2012%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2013_x86.exe" -U "%USERAGENT%" "%vc2013%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2015_x86.exe" -U "%USERAGENT%" "%vc2015%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2005_x64.exe" -U "%USERAGENT%" "%vc2005x64%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2008_x64.exe" -U "%USERAGENT%" "%vc2008x64%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2010_x64.exe" -U "%USERAGENT%" "%vc2010x64%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2012_x64.exe" -U "%USERAGENT%" "%vc2012x64%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2013_x64.exe" -U "%USERAGENT%" "%vc2013x64%"
		wget --no-check-certificate --show-progress -q -O "%download_folder%\vc2015_x64.exe" -U "%USERAGENT%" "%vc2015x64%"
	)
) else (
	if %ARCH%==X86 (
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2005_x86.exe" "%vc2005%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2008_x86.exe" "%vc2008%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2010_x86.exe" "%vc2010%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2012_x86.exe" "%vc2012%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2013_x86.exe" "%vc2013%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2015_x86.exe" "%vc2015%" --insecure
	) else (
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2005_x86.exe" "%vc2005%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2008_x86.exe" "%vc2008%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2010_x86.exe" "%vc2010%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2012_x86.exe" "%vc2012%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2013_x86.exe" "%vc2013%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2015_x86.exe" "%vc2015%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2005_x64.exe" "%vc2005x64%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2008_x64.exe" "%vc2008x64%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2010_x64.exe" "%vc2010x64%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2012_x64.exe" "%vc2012x64%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2013_x64.exe" "%vc2013x64%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%download_folder%\vc2015_x64.exe" "%vc2015x64%" --insecure || (
			if exist "%temp%\download_error.txt" del "%temp%\download_error.txt"
			echo.
			echo wget.exe or curl.exe not found to download, please download at: >> %temp%\download_error.txt
			echo. >> %temp%\download_error.txt
			echo wget: https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/wget.exe >> %temp%\download_error.txt
			echo wget: https://eternallybored.org/misc/wget/ >> %temp%\download_error.txt
			echo curl: https://curl.se/download.html >> %temp%\download_error.txt
			type "%temp%\download_error.txt"
			start "" "%temp%\download_error.txt"
		)
	)
)

if not exist "%download_folder%\vc2015_x86.exe" if not exist "%download_folder%\vc2015_x64.exe" (
	echo Download %SOFTNAME% failed.
	echo Please check your network connection. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

@ECHO OFF
title _Hieuck.IT_'s Windows Application Downloading 7-Zip...
color 0B
mode con:cols=100 lines=17
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Tai 7-Zip. Vui Long Cho...
@echo off
pushd "%~dp0"
echo Downloading 7-Zip...
if "%Extract7z%"=="Yes" (
	if exist "wget.exe" (
		wget --no-check-certificate --show-progress -q -O "7z.dll" -U "%USERAGENT%" "%LINK7zdll%"
		wget --no-check-certificate --show-progress -q -O "7z.exe" -U "%USERAGENT%" "%LINK7zexe%"
	) else (
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.dll" "%LINK7zdll%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.exe" "%LINK7zexe%" --insecure
	)
)

:: Install
@ECHO OFF
title _Hieuck.IT_'s Windows Application Installing...
color 0B
mode con:cols=100 lines=17
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Cai Dat %SOFTNAME%. Vui Long Cho...
@echo off
pushd "%~dp0"
echo Installing %SOFTNAME%...
if "%Extract7z%"=="Yes" (
	@7z.exe x "%FILENAME%" -o"%SOFTPATH%" -aoa -y
) else (
	if %ARCH%==X86 (
		start /wait "" "%download_folder%\vc2005_x86.exe" /q
		start /wait "" "%download_folder%\vc2008_x86.exe" /q
		start /wait "" "%download_folder%\vc2010_x86.exe" /q
		start /wait "" "%download_folder%\vc2012_x86.exe" /q
		start /wait "" "%download_folder%\vc2013_x86.exe" /q
		start /wait "" "%download_folder%\vc2015_x86.exe" /install /quiet /norestart
	) else (
		start /wait "" "%download_folder%\vc2005_x86.exe" /q
		start /wait "" "%download_folder%\vc2008_x86.exe" /q
		start /wait "" "%download_folder%\vc2010_x86.exe" /q
		start /wait "" "%download_folder%\vc2012_x86.exe" /q
		start /wait "" "%download_folder%\vc2013_x86.exe" /q
		start /wait "" "%download_folder%\vc2015_x86.exe" /install /quiet /norestart
		start /wait "" "%download_folder%\vc2005_x64.exe" /q
		start /wait "" "%download_folder%\vc2008_x64.exe" /q
		start /wait "" "%download_folder%\vc2010_x64.exe" /q
		start /wait "" "%download_folder%\vc2012_x64.exe" /q
		start /wait "" "%download_folder%\vc2013_x64.exe" /q
		start /wait "" "%download_folder%\vc2015_x64.exe" /install /quiet /norestart
	)
)

setlocal EnableDelayedExpansion
if %ARCH%==X86 (
	:: Check Visual C++ Runtimes installed
	reg query "HKLM\Software\Microsoft\VisualStudio\14.0\VC\Runtimes\X86" /v Version > nul 2>&1
	if %errorlevel% equ 0 (
		echo Visual C++ Runtimes X86 is installed.
	) else (
		echo Visual C++ Runtimes X86 is not installed.
	)
) else (
	:: Check Visual C++ Runtimes installed
	reg query "HKLM\Software\Microsoft\VisualStudio\14.0\VC\Runtimes\X64" /v Version > nul 2>&1
	if %errorlevel% equ 0 (
		echo Visual C++ Runtimes X64 is installed.
	) else (
		echo Visual C++ Runtimes X64 is not installed.
	)
)
endlocal

timeout /t 3

:: License
@ECHO OFF
title _Hieuck.IT_'s Windows Application Cr4cking...
color 0B
mode con:cols=100 lines=17
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Cau Hinh %SOFTNAME%. Vui Long Cho...
@echo off
pushd "%~dp0"
if "%License%"=="Yes" (
	echo Cr4cking %SOFTNAME%...
	if exist "wget.exe" (
		wget --no-check-certificate --show-progress -q -O "7z.dll" -U "%USERAGENT%" "%LINK7zdll%"
		wget --no-check-certificate --show-progress -q -O "7z.exe" -U "%USERAGENT%" "%LINK7zexe%"
		wget --no-check-certificate --show-progress -q -O "%CR4CKFILE%" -U "%USERAGENT%" "%CR4CKLINK%"
	) else (
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.dll" "%LINK7zdll%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.exe" "%LINK7zexe%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%CR4CKFILE%" "%CR4CKLINK%" --insecure
	)
	if exist "%CR4CKFILE%" (
		@7z.exe x -p123 "%CR4CKFILE%" -o"%CR4CKPATH%" -aoa -y
		echo Successfully Cr4cked %SOFTNAME%.
		del "%CR4CKFILE%"
	) else (
		echo Cr4cking %SOFTNAME% failed.
		echo Please try running the script as Administrator.
	)
)

:: Shortcut
if /i "%Shortcut%"=="no" (
    echo Creating shortcut is skipped.
    goto CleanUp
)

if exist "%SOFTLOCATION%" (
	set "TARGETFILE=%SOFTLOCATION%"
) else (
	echo %SOFTNAME% does not exist in directory "%SOFTPATH%". Exiting script.
	exit /b 1
)

set "SHORTCUTNAME=%SOFTNAME%.lnk"
set "SHORTCUTPATH=%PUBLIC%\Desktop\%SHORTCUTNAME%"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%SHORTCUTPATH%" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%TARGETFILE%" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%SOFTPATH%" >> CreateShortcut.vbs
echo oLink.Description = "Shortcut to %SOFTNAME%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs

if exist "%PUBLIC%\Desktop\%SHORTCUTNAME%" (
	echo Creating shortcut complete.
) else (
	echo Creating shortcut failed.
)

:: Clean Up
:CleanUp
echo Cleaning up temporary files...
if exist "%download_folder%\vc2005_x86.exe" del "%download_folder%\vc2005_x86.exe"
if exist "%download_folder%\vc2005_x64.exe" del "%download_folder%\vc2005_x64.exe"
if exist "%download_folder%\vc2008_x86.exe" del "%download_folder%\vc2008_x86.exe"
if exist "%download_folder%\vc2008_x64.exe" del "%download_folder%\vc2008_x64.exe"
if exist "%download_folder%\vc2010_x86.exe" del "%download_folder%\vc2010_x86.exe"
if exist "%download_folder%\vc2010_x64.exe" del "%download_folder%\vc2010_x64.exe"
if exist "%download_folder%\vc2012_x86.exe" del "%download_folder%\vc2012_x86.exe"
if exist "%download_folder%\vc2012_x64.exe" del "%download_folder%\vc2012_x64.exe"
if exist "%download_folder%\vc2013_x86.exe" del "%download_folder%\vc2013_x86.exe"
if exist "%download_folder%\vc2013_x64.exe" del "%download_folder%\vc2013_x64.exe"
if exist "%download_folder%\vc2015_x86.exe" del "%download_folder%\vc2015_x86.exe"
if exist "%download_folder%\vc2015_x64.exe" del "%download_folder%\vc2015_x64.exe"
if exist "%temp%\download_error.txt" del "%temp%\download_error.txt"
if exist "7z.dll" del "7z.dll"
if exist "7z.exe" del "7z.exe"
rmdir /s /q "%download_folder%"

:: Save the value of the %time% variable after the batch script finishes
set end_time=%time%

:: Calculate the difference between the two %start_time% and %end_time% values
set /a elapsed_time=(%end_time:~0,2%*3600 + %end_time:~3,2%*60 + %end_time:~6,2%) - (%start_time:~0,2%*3600 + %start_time:~3,2%*60 + %start_time:~6,2%)

echo Time elapsed: %elapsed_time% seconds.

echo The script will automatically close in 3 seconds.
for /l %%i in (3,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
	if exist "7z.dll" (
		tasklist | find /i "7z.dll" > nul
		if %errorlevel% equ 0 taskkill /im "7z.dll" /f
		del "7z.dll"
	)

	if exist "7z.exe" (
		tasklist | find /i "7z.exe" > nul
		if %errorlevel% equ 0 taskkill /im "7z.exe" /f
		del "7z.exe"
	)

	if exist "%FILENAME%" (
		tasklist | find /i "%FILENAME%" > nul
		if %errorlevel% equ 0 taskkill /im "%FILENAME%" /f
		del "%FILENAME%"
	)
)
echo Please close the script manually if automatically close fails.
popd