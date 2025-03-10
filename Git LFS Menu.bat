@echo off
setlocal

git-lfs version

:InputPath
echo Enter Repo Path: 
set /p "LocalPath="

pushd "%LocalPath%"
cd  "%LocalPath%"

rem Check if the path has been set
if not exist "%LocalPath%" (
	echo Repo "%LocalPath%" not found
	goto InputPath
)

:menu
set "Menu1=Git LFS Install"
set "Menu2=Git LFS Unsinstall"
set "Menu3=Git LFS Track "*.exe""
set "Menu4=Git LFS Untrack "*.exe""
set "Menu5=Restart
set "Menu6=Exit (999s)

echo.
echo Git LFS
echo 1. %Menu1%				2. %Menu2%
echo.
echo 3. %Menu3%			4. %Menu4%
echo.
echo 5/R. %Menu5%					6/E. %Menu6%

REM The number corresponding to the default choice
set "defaultChoice=E"
echo Select an option (1 or 2 or 3 or R or E) [Default is %defaultChoice%]: 
choice /c 1234re /t 999 /d %defaultChoice% /n >nul

REM Check the errorlevel to determine the choice made by the user
if "%errorlevel%"=="1" (
	set "choice=1"
) else if "%errorlevel%"=="2" (
	set "choice=2"
) else if "%errorlevel%"=="3" (
	set "choice=3"
) else if "%errorlevel%"=="4" (
	set "choice=4"
) else if "%errorlevel%"=="5" (
	set "choice=r"
) else if "%errorlevel%"=="6" (
	set "choice=e"
)

if "%choice%"=="1" (
	git lfs install
) else if "%choice%"=="2" (
	git lfs uninstall
) else if "%choice%"=="3" (
	git lfs track "*.exe"
) else if "%choice%"=="4" (
	git lfs untrack "*.exe"
) else if /i "%choice%"=="r" (
	goto InputPath
) else if /i "%choice%"=="e" (
	exit
)
endlocal