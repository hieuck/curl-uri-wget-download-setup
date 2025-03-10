@echo off
REM Request to edit the hosts file.
setlocal enabledelayedexpansion

REM IP address to add to the hosts file
set ip_address=127.0.0.1

REM Comment to be added
set "comment=Camtasia"

REM List of hostnames to block
set "hosts_to_block=activation.cloud.techsmith.com oscount.techsmith.com updater.techsmith.com camtasiatudi.techsmith.com tsccloud.cloudapp.net assets.cloud.techsmith.com"

REM Check if the hosts file exists
if not exist "%SystemRoot%\System32\drivers\etc\hosts" (
	echo The hosts file does not exist.
	if exist "wget.exe" (
		wget --no-check-certificate --show-progress -q -O "%SystemRoot%\System32\drivers\etc\hosts" -U "%UserAgent%" "https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/hosts"
	) else (
		curl -L --max-redirs 20 -A "%UserAgent%" -o "%SystemRoot%\System32\drivers\etc\hosts" "https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/hosts" --insecure
	)
	exit /b
)

REM Read the hosts file line by line into an array
set /a index=0
for /f "tokens=*" %%a in ('type "%SystemRoot%\System32\drivers\etc\hosts"') do (
	set "lines[!index!]=%%a"
	set /a index+=1
)
REM Check if each comment is already in the hosts file
for %%i in (!comment!) do (
	set found=false
	for /l %%j in (0,1,!index!) do (
		echo !lines[%%j]! | findstr /i "%%i" >nul
		if errorlevel 1 (
			echo !found! | findstr /i "true" >nul
			if not errorlevel 1 (
				set found=false
			)
		) else (
			set found=true
			echo %%i is already present in the hosts file, no need to add.
			goto EndCheckComment
		)
	)
	if "!found!"=="false" (
		echo Adding %%i to the hosts file...
		REM Add the comment line
		echo. >> "%SystemRoot%\System32\drivers\etc\hosts"
		echo # %comment% >> "%SystemRoot%\System32\drivers\etc\hosts"
    )
)

:EndCheckComment
REM Check if each hostname is already in the hosts file
for %%i in (!hosts_to_block!) do (
	set found=false
	for /l %%j in (0,1,!index!) do (
		echo !lines[%%j]! | findstr /i "%%i" >nul
		if errorlevel 1 (
			echo !found! | findstr /i "true" >nul
			if not errorlevel 1 (
				set found=false
			)
		) else (
			set found=true
			echo %%i is already present in the hosts file, no need to add.
			goto EndCheckHostsFile
		)
	)
	if "!found!"=="false" (
		echo Adding %%i to the hosts file...
		echo %ip_address% %%i >> "%SystemRoot%\System32\drivers\etc\hosts"
    )
)
endlocal

:EndCheckHostsFile
REM Display completion message
echo Editing the hosts file completed.
