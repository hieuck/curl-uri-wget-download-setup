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
@echo                 The current date and time are: %date% %time%
@echo                 The current date and time are: %date% %time%> %Temp%\hieuckitlog.txt
@echo                 Dang Cau Hinh Zalo. Vui Long Cho...
@echo                 Dang Cau Hinh Zalo. Vui Long Cho...>> %Temp%\hieuckitlog.txt
@echo off
setlocal EnableDelayedExpansion

set "ZaloPath="

:InputDrive
echo Enter the drive character for Zalo (e.g., D, E, F):
echo Nhap ky tu cua o cho Zalo (vi du: D, E, F):

set /p "DriveChar="

rem Determine the full path for Zalo
rem Change the path to the actual Zalo installation directory here
set "ZaloPath=!DriveChar!:\Zalo"

md "!ZaloPath!\ZaloPC"2>NUL>> %Temp%\hieuckitlog.txt
md "!ZaloPath!\ZaloData"2>NUL>> %Temp%\hieuckitlog.txt
md "!ZaloPath!\Zalo Received Files"2>NUL>> %Temp%\hieuckitlog.txt

rem Check if the path has been set
if not exist "!ZaloPath!" (
	echo Drive "!DriveChar!:\" not found
	goto InputDrive
)

title _Hieuck.IT_'s Windows Application Stopping Zalo...
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Tat Zalo. Vui Long Cho...
@echo off

net stop "Zalo" >2>NUL>> %Temp%\hieuckitlog.txt
taskkill /im "Zalo.exe" /f >2>NUL>> %Temp%\hieuckitlog.txt
taskkill /im "ZaloCall.exe" /f >2>NUL>> %Temp%\hieuckitlog.txt
taskkill /im "ZaloCap.exe" /f >2>NUL>> %Temp%\hieuckitlog.txt
taskkill /im "ZaviMeet.exe" /f >2>NUL>> %Temp%\hieuckitlog.txt

title _Hieuck.IT_'s Windows Application Coppying Zalo...
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Sao Chep Zalo. Vui Long Cho...
@echo off

xcopy "%LocalAppData%\ZaloPC" "!ZaloPath!\ZaloPC" /I /E /Y>> %Temp%\hieuckitlog.txt
xcopy "%AppData%\ZaloData" "!ZaloPath!\ZaloData" /I /E /Y>> %Temp%\hieuckitlog.txt
if exist "%UserProfile%\OneDrive\Documents\Zalo Received Files" (
	xcopy "%UserProfile%\Documents\Zalo Received Files" "!ZaloPath!\Zalo Received Files" /I /E /Y>> %Temp%\hieuckitlog.txt
)
xcopy "%UserProfile%\Documents\Zalo Received Files" "!ZaloPath!\Zalo Received Files" /I /E /Y>> %Temp%\hieuckitlog.txt

title _Hieuck.IT_'s Windows Application Cleaning Zalo...
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Don Dep Zalo. Vui Long Cho...
@echo off

echo Please Check Your Zalo Storage Before Pressing Enter.
echo Vui Long Kiem Tra Dung Luong Zalo Truoc Khi Nhan Enter.
cd "%LocalAppData%\ZaloPC" &pushd "%LocalAppData%\ZaloPC"
start. &popd
cd "!ZaloPath!\ZaloPC" &pushd "!ZaloPath!\ZaloPC"
start. &popd
cd "%AppData%\ZaloData" &pushd "%AppData%\ZaloData"
start. &popd
cd "!ZaloPath!\ZaloData" &pushd "!ZaloPath!\ZaloData"
start. &popd
if exist "%UserProfile%\OneDrive\Documents\Zalo Received Files" (
	cd "%UserProfile%\OneDrive\Documents\Zalo Received Files" &pushd "%UserProfile%\OneDrive\Documents\Zalo Received Files"
	start. &popd
)
if exist "%UserProfile%\Documents\Zalo Received Files" (
	cd "%UserProfile%\Documents\Zalo Received Files" &pushd "%UserProfile%\Documents\Zalo Received Files"
start. &popd
)
cd "!ZaloPath!\Zalo Received Files" &pushd "!ZaloPath!\Zalo Received Files"
start. &popd
pause

rmdir "%LocalAppData%\ZaloPC" /s /q>> %Temp%\hieuckitlog.txt
rmdir "%AppData%\ZaloData" /s /q>> %Temp%\hieuckitlog.txt
if exist "%UserProfile%\OneDrive\Documents\Zalo Received Files" (
	rmdir "%UserProfile%\OneDrive\Documents\Zalo Received Files" /s /q>> %Temp%\hieuckitlog.txt
)
rmdir "%UserProfile%\Documents\Zalo Received Files" /s /q>> %Temp%\hieuckitlog.txt

title _Hieuck.IT_'s Windows Application Linking Zalo...
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Lien Ket Zalo. Vui Long Cho...
@echo off

mklink /D "%LocalAppData%\ZaloPC" "!ZaloPath!\ZaloPC">> %Temp%\hieuckitlog.txt
mklink /D "%AppData%\ZaloData" "!ZaloPath!\ZaloData">> %Temp%\hieuckitlog.txt
if exist "%UserProfile%\OneDrive\Documents\Zalo Received Files" (
	mklink /D "%UserProfile%\OneDrive\Documents\Zalo Received Files" "!ZaloPath!\Zalo Received Files">> %Temp%\hieuckitlog.txt
)
mklink /D "%UserProfile%\Documents\Zalo Received Files" "!ZaloPath!\Zalo Received Files">> %Temp%\hieuckitlog.txt

@echo Zalo path has been set to: !ZaloPath!
@echo Zalo path has been set to: !ZaloPath!>> %Temp%\hieuckitlog.txt
@echo Da Hoan Thanh Chuyen Zalo Sang !ZaloPath!
@echo Da Hoan Thanh Chuyen Zalo Sang !ZaloPath!>> %Temp%\hieuckitlog.txt

title _Hieuck.IT_'s Windows Application Opening Zalo...
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
@echo                 The current date and time are: %date% %time%
@echo                 Dang Chuan Bi Mo Zalo. Vui Long Cho...
@echo off

rem Get the user's input
set "choice="
set /p choice="Press Z or the Space and Enter key to open Zalo, or any other key to exit: "

rem Check if the user pressed Z, Enter, or any other key
if /i "%choice%" == "Z" (
	start "" "%LocalAppData%\Programs\Zalo\Zalo.exe"
) else if /i "%choice%" == " " (
	start "" "%LocalAppData%\Programs\Zalo\Zalo.exe"
) else if /i "%choice%" == "" (
	start "" "%LocalAppData%\Programs\Zalo\Zalo.exe"
) else (
	echo Exiting...
	exit
)
popd