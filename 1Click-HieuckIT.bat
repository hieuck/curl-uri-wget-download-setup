::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::																								::
::							https://linktr.ee/hieuckit											::
::		Github:				https://github.com/hieuck/curl-uri-wget-download-setup				::
::		Facebook:			https://www.facebook.com/ZzhieuhuhongzZ/							::
::		Donate to me:		Vietcombank - 9966595263 - LE TRUNG HIEU							::
::																								::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF
pushd "%~dp0"

REM Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

title _Hieuck.IT_'s Windows Application Setting Up...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
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
@echo                 Dang Cau Hinh %SoftName%. Vui Long Cho...
@echo off
REM Required Configuration Settings

set "SoftName=1-Click-HieuckIT"

set "UserAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

REM Set code based on Windows Architecture
REM Source Link: https://github.com/hieuck/curl-uri-wget-download-setup

set "wget=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/wget.exe"
set "AnyDesk=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/AnyDesk.bat"
set "CocCoc=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/CocCoc.bat"
set "EVKeyFor1Click=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/EVKeyFor1Click.bat"
set "FoxitPDFReader=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/FoxitPDFReader.bat"
set "GoogleChrome=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/GoogleChrome.bat"
set "K-LiteCodecPackMega=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/K-LiteCodecPackMega.bat"
set "MicrosoftDirectX=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/MicrosoftDirectXEnd-UserRuntime.bat"
set "MicrosoftOffice=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/MicrosoftOffice.bat"
set "Notepad=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Notepad++.bat"
set "RevoUninstaller=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/RevoUninstaller.bat"
set "TeamViewer=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/TeamViewer.bat"
set "UltraViewer=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/UltraViewer.bat"
set "WinRAR=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/WinRAR.bat"
set "Zalo=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Zalo.bat"

:: Create download folder
set "download_folder=%~dp0\1Click-HieuckIT"
md "%download_folder%" 2>NUL

REM Save the value of the %time% variable before running the batch script
set start_time=%time%

::Check Windows OS Version and Check Support Old Windows
setlocal EnableDelayedExpansion
for /f "tokens=4 delims=[.] " %%i in ('ver') do (
	set "version1=%%i"
)

for /f "tokens=5 delims=[.] " %%i in ('ver') do (
	set "version2=%%i"
)
set "version=%version1%.%version2%"

if "%version%"=="6.1" goto ForOldWindows
goto ForNewWindows
endlocal

:ForOldWindows
md "C:\Z_Hieuck.IT_Z" 2>NUL
%SystemRoot%\System32\control.exe /name Microsoft.NetworkAndSharingCenter
%SystemRoot%\System32\wscui.cpl
%SystemRoot%\System32\desk.cpl ,,5
set "Cr4ckWindows7=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Cr4ckWindows7.bat"
if exist "wget.exe" (
	wget --no-check-certificate --show-progress -q -O "%download_folder%\Cr4ckWindows7.bat" -U "%UserAgent%" "%Cr4ckWindows7%"
) else (
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\Cr4ckWindows7.bat" "%Cr4ckWindows7%" --insecure
)
goto NextStepForCheckOSVersion

:ForNewWindows
md "C:\Z_Hieuck.IT_Z" 2>NUL
powershell -Command Add-MpPreference -ExclusionPath "C:\Z_Hieuck.IT_Z"
powershell -Command Add-MpPreference -ExclusionPath "%Public%\Desktop\Z_Hieuck.IT_Z"
powershell Set-WinDefaultInputMethodOverride -InputTip "0409:00000409"
powershell -Command "Start-Process 'ms-settings:notifications'"
%SystemRoot%\System32\control.exe /name Microsoft.NetworkAndSharingCenter
%SystemRoot%\System32\wscui.cpl
%SystemRoot%\System32\desk.cpl ,,5

:NextStepForCheckOSVersion
REM Download
title _Hieuck.IT_'s Windows Application Downloading...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
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
@echo                 Dang Tai %SoftName%. Vui Long Cho...
@echo off
echo Downloading %SoftName%...
if exist "wget.exe" (
	wget --no-check-certificate --show-progress -q -O "%download_folder%\wget.exe" -U "%UserAgent%" "%wget%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\AnyDesk.bat" -U "%UserAgent%" "%AnyDesk%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\CocCoc.bat" -U "%UserAgent%" "%CocCoc%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\EVKeyFor1Click.bat" -U "%UserAgent%" "%EVKeyFor1Click%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\FoxitPDFReader.bat" -U "%UserAgent%" "%FoxitPDFReader%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\GoogleChrome.bat" -U "%UserAgent%" "%GoogleChrome%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\K-LiteCodecPackMega.bat" -U "%UserAgent%" "%K-LiteCodecPackMega%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\MicrosoftDirectXEnd-UserRuntime.bat" -U "%UserAgent%" "%MicrosoftDirectX%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\MicrosoftOffice.bat" -U "%UserAgent%" "%MicrosoftOffice%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\Notepad++.bat" -U "%UserAgent%" "%Notepad%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\RevoUninstaller.bat" -U "%UserAgent%" "%RevoUninstaller%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\TeamViewer.bat" -U "%UserAgent%" "%TeamViewer%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\UltraViewer.bat" -U "%UserAgent%" "%UltraViewer%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\WinRAR.bat" -U "%UserAgent%" "%WinRAR%"
	wget --no-check-certificate --show-progress -q -O "%download_folder%\Zalo.bat" -U "%UserAgent%" "%Zalo%"
) else (
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\wget.exe" "%wget%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\AnyDesk.bat" "%AnyDesk%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\CocCoc.bat" "%CocCoc%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\EVKeyFor1Click.bat" "%EVKeyFor1Click%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\FoxitPDFReader.bat" "%FoxitPDFReader%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\GoogleChrome.bat" "%GoogleChrome%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\K-LiteCodecPackMega.bat" "%K-LiteCodecPackMega%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\MicrosoftDirectXEnd-UserRuntime.bat" "%MicrosoftDirectX%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\MicrosoftOffice.bat" "%MicrosoftOffice%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\Notepad++.bat" "%Notepad%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\RevoUninstaller.bat" "%RevoUninstaller%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\TeamViewer.bat" "%TeamViewer%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\UltraViewer.bat" "%UltraViewer%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\WinRAR.bat" "%WinRAR%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%download_folder%\Zalo.bat" "%Zalo%" --insecure || (
		echo.
		echo wget.exe or curl.exe not found to download, please download at: > %Temp%\hieuckitlog.txt
		echo. >> %Temp%\hieuckitlog.txt
		echo wget: https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/wget.exe >> %Temp%\hieuckitlog.txt
		echo wget: https://eternallybored.org/misc/wget/ >> %Temp%\hieuckitlog.txt
		echo curl: https://curl.se/download.html >> %Temp%\hieuckitlog.txt
		type "%Temp%\hieuckitlog.txt"
		start "" "%Temp%\hieuckitlog.txt"
	)
)

REM Install
title _Hieuck.IT_'s Windows Application Installing...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
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
@echo                 Dang Cai Dat %SoftName%. Vui Long Cho...
@echo off
echo Installing %SoftName%...

set KeyName=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer
set ValueName=Link
set ValueType=REG_BINARY
set ValueData=00000000

reg add "%KeyName%" /v "%ValueName%" /t %ValueType% /d %ValueData% /f

pushd "%~dp0"
call "%download_folder%\AnyDesk.bat"
pushd "%~dp0"
call "%download_folder%\CocCoc.bat"
pushd "%~dp0"
call "%download_folder%\EVKeyFor1Click.bat"
pushd "%~dp0"
call "%download_folder%\FoxitPDFReader.bat"
pushd "%~dp0"
call "%download_folder%\GoogleChrome.bat"
pushd "%~dp0"
call "%download_folder%\K-LiteCodecPackMega.bat"
pushd "%~dp0"
call "%download_folder%\MicrosoftDirectXEnd-UserRuntime.bat"
pushd "%~dp0"
call "%download_folder%\MicrosoftOffice.bat"
pushd "%~dp0"
call "%download_folder%\Notepad++.bat"
pushd "%~dp0"
call "%download_folder%\RevoUninstaller.bat"
pushd "%~dp0"
call "%download_folder%\TeamViewer.bat"
pushd "%~dp0"
call "%download_folder%\UltraViewer.bat"
pushd "%~dp0"
call "%download_folder%\WinRAR.bat"
pushd "%~dp0"
call "%download_folder%\Zalo.bat"
pushd "%~dp0"
if exist "%download_folder%\Cr4ckWindows7.bat" call "%download_folder%\Cr4ckWindows7.bat"

REM Clean Up
:CleanUp
title _Hieuck.IT_'s Windows Application Cleaning Up...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
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
@echo                 Dang Don Dep %SoftName%. Vui Long Cho...
@echo off
echo Cleaning up temporary files...
echo.>> %Temp%\hieuckitlog.txt
setlocal EnableDelayedExpansion
set count=0
set deleteSuccess=0
:waitloopcheck
if exist "%download_folder%\7z.dll" del "%download_folder%\7z.dll">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\7z.exe" del "%download_folder%\7z.exe">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\wget.exe" del "%download_folder%\wget.exe">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\AnyDesk.bat" del "%download_folder%\AnyDesk.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\CocCoc.bat" del "%download_folder%\CocCoc.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\EVKeyFor1Click.bat" del "%download_folder%\EVKeyFor1Click.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\FoxitPDFReader.bat" del "%download_folder%\FoxitPDFReader.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\GoogleChrome.bat" del "%download_folder%\GoogleChrome.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\K-LiteCodecPackMega.bat" del "%download_folder%\K-LiteCodecPackMega.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\MicrosoftDirectXEnd-UserRuntime.bat" del "%download_folder%\MicrosoftDirectXEnd-UserRuntime.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\MicrosoftOffice.bat" del "%download_folder%\MicrosoftOffice.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\Configuration.xml" del "%download_folder%\Configuration.xml">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\Notepad++.bat" del "%download_folder%\Notepad++.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\RevoUninstaller.bat" del "%download_folder%\RevoUninstaller.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\TeamViewer.bat" del "%download_folder%\TeamViewer.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\UltraViewer.bat" del "%download_folder%\UltraViewer.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\WinRAR.bat" del "%download_folder%\WinRAR.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\Zalo.bat" del "%download_folder%\Zalo.bat">> %Temp%\hieuckitlog.txt 2>&1
if exist "%download_folder%\Cr4ckWindows7.bat" del "%download_folder%\Cr4ckWindows7.bat">> %Temp%\hieuckitlog.txt 2>&1
REM rmdir /s /q "%download_folder%"
timeout /t 1 /nobreak > nul
set /a count+=1
if !deleteSuccess! equ 1 (
	echo The %SoftName% installer has been deleted.
	echo The %SoftName% installer has been deleted.>> %Temp%\hieuckitlog.txt
	goto endcheck
) else (
	echo.>> %Temp%\hieuckitlog.txt
)
if !count! equ 30 goto timeoutcheck
goto waitloopcheck
:timeoutcheck
echo Timeout: Deletion failed. Please delete the file manually.
echo Timeout: Deletion failed. Please delete the file manually.>> %Temp%\hieuckitlog.txt
:endcheck
REM Save the value of the %time% variable after the batch script finishes
set end_time=%time%

REM Convert the start and end times to seconds
for /f "tokens=1-3 delims=:." %%a in ("%start_time%") do set /a "start_seconds=(((%%a*60)+1%%b %% 100)*60)+1%%c %% 100"
for /f "tokens=1-3 delims=:." %%a in ("%end_time%") do set /a "end_seconds=(((%%a*60)+1%%b %% 100)*60)+1%%c %% 100"

REM Calculate the elapsed time in seconds
set /a elapsed_time=%end_seconds%-%start_seconds%

echo Time elapsed: %elapsed_time% seconds.

echo The script will automatically close in 3 seconds.
for /l %%i in (3,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
)
echo Please close the script manually if automatically close fails.

setlocal

REM Check if the EVKey64.exe or EVKey32.exe process is running
tasklist | findstr /i "EVKey64.exe EVKey32.exe"
if %errorlevel% neq 0 (
    REM If no process is found, start EVKey.lnk on the Desktop
    start "" "%Public%\Desktop\EVKey.lnk"
)

endlocal

popd