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
@echo                 Dang Cau Hinh Chrome. Vui Long Cho...
@echo                 Dang Cau Hinh Chrome. Vui Long Cho...>> %Temp%\hieuckitlog.txt
@echo off
setlocal EnableDelayedExpansion

set "ChromePath="

:InputDrive
echo Enter the drive character for Chrome (e.g., D, E, F):
echo Nhap ky tu cua o cho Chrome (vi du: D, E, F):

set /p "DriveChar="

rem Determine the full path for Chrome
rem Change the path to the actual Chrome installation directory here
set "ChromePath=!DriveChar!:\Chrome"

md "!ChromePath!\User Data"2>NUL>> %Temp%\hieuckitlog.txt


rem Check if the path has been set
if not exist "!ChromePath!" (
	echo Drive "!DriveChar!:\" not found
	goto InputDrive
)

title _Hieuck.IT_'s Windows Application Stopping Chrome...
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
@echo                 Dang Tat Chrome. Vui Long Cho...
@echo off

net stop "Chrome" >2>NUL>> %Temp%\hieuckitlog.txt
taskkill /im "Chrome.exe" /f >2>NUL>> %Temp%\hieuckitlog.txt

title _Hieuck.IT_'s Windows Application Coppying Chrome...
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
@echo                 Dang Sao Chep Chrome. Vui Long Cho...
@echo off

xcopy "%LocalAppData%\Google\Chrome" "!ChromePath!" /I /E /Y>> %Temp%\hieuckitlog.txt

title _Hieuck.IT_'s Windows Application Cleaning Chrome...
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
@echo                 Dang Don Dep Chrome. Vui Long Cho...
@echo off

echo Please Check Your Chrome Storage Before Pressing Enter.
echo Vui Long Kiem Tra Dung Luong Chrome Truoc Khi Nhan Enter.
cd "%LocalAppData%\Google\Chrome" &pushd "%LocalAppData%\Google\Chrome"
start. &popd
cd "!ChromePath!" &pushd "!ChromePath!"
start. &popd
pause

rmdir "%LocalAppData%\Google\Chrome" /s /q>> %Temp%\hieuckitlog.txt

title _Hieuck.IT_'s Windows Application Linking Chrome...
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
@echo                 Dang Lien Ket Chrome. Vui Long Cho...
@echo off

mklink /D "%LocalAppData%\Google\Chrome" "!ChromePath!">> %Temp%\hieuckitlog.txt

@echo Chrome path has been set to: !ChromePath!
@echo Chrome path has been set to: !ChromePath!>> %Temp%\hieuckitlog.txt
@echo Da Hoan Thanh Chuyen Chrome Sang !ChromePath!
@echo Da Hoan Thanh Chuyen Chrome Sang !ChromePath!>> %Temp%\hieuckitlog.txt

title _Hieuck.IT_'s Windows Application Opening Chrome...
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
@echo                 Dang Chuan Bi Mo Chrome. Vui Long Cho...
@echo off

rem Get the user's input
set "choice="
set /p choice="Press Z or the Space and Enter key to open Chrome, or any other key to exit: "

rem Check if the user pressed Z, Enter, or any other key
if /i "%choice%" == "Z" (
	start "" "%ProgramFiles%\Google\Chrome\Application\Chrome.exe"
) else if /i "%choice%" == " " (
	start "" "%ProgramFiles%\Google\Chrome\Application\Chrome.exe"
) else if /i "%choice%" == "" (
	start "" "%ProgramFiles%\Google\Chrome\Application\Chrome.exe"
) else (
	echo Exiting...
	exit
)
popd