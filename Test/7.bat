@echo off
set "SoftName=DirectX"
set "FileName=msi"
set "Link=https://example.com/file.rar"

setlocal enabledelayedexpansion

REM Data structure to store format-extension information
set "Formats=7z exe msi rar zip"

for %%F in ("%FileName%") do (
	set "BaseName=%%~nF"
	if not "%%~xF"=="" (
		set "Extension=%%~xF"
	) else (
		set "Extension=.HieuckIT"
		set "BaseName=!FileName!"
	)
)

echo BaseName1: %BaseName%
echo Extension1: %Extension%
echo FileName1: %FileName%
echo.

if not "%FileName%"=="" (
	if not "%BaseName%"=="" (
		REM Loop through the formats in the data structure
		for %%F in (%Formats%) do (
			REM Check if FileName matches the format
			if /i "%FileName%"=="%%~F" (
				set "BaseName=%SoftName%"
				set "Extension=.%%~F"
				set "FileName=!BaseName!!Extension!"
				goto :Continue
			)
		)
		
		REM Check if FileName doesn't match any format
		if not "!FileName!"=="!BaseName!!Extension!" (
			set "FileName=%BaseName%%Extension%"
		)
	) else (
		set "FileName=%SoftName%%Extension%"
	)
) else (
	if not "%Link:~-4%"=="" (
		REM Extract the extension from Link
		set "Extension=%Link:~-4%"
		set "BaseName=%SoftName%"
		set "FileName=!BaseName!!Extension!"
		goto :Continue
	) else (
		set "FileName=%SoftName%.HieuckIT"
	)
)

:Continue
REM Check if Link's extension matches any format and differs from FileName's extension
if not "%Link:~-4%"=="" (
    set "LinkExtension=%Link:~-4%"
    set "ValidExtension="
    for %%F in (%Formats%) do (
        if /i "!LinkExtension!"=="%%~F" (
            set "ValidExtension=1"
            if not "!Extension!"=="%%~F" (
                set "BaseName=%SoftName%"
                set "Extension=.%%~F"
                set "FileName=!BaseName!!Extension!"
                goto :PrintResult
            )
        )
    )
    
    REM If Link's extension didn't match any valid format or matched FileName's extension, set ValidExtension to false
    if not defined ValidExtension (
        set "ValidExtension="
    )
) else (
    set "ValidExtension="
)

REM If Link's extension is not valid, use SoftName.HieuckIT as FileName
if not defined ValidExtension (
    set "FileName=%SoftName%.HieuckIT"
)

:PrintResult
echo Link2: %Link:~-4%
echo BaseName2: %BaseName%
echo Extension2: %Extension%
echo LinkExtension: !LinkExtension!
echo FileName2: %FileName%
pause
endlocal
