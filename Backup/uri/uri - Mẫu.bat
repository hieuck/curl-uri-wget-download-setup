@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=15
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
@echo                 Dang Cai Dat tenphanmem. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "tenkill.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading tenphanmem...
if %ARCH%==x64 (
    powershell -Command "Invoke-WebRequest -Uri 'link64' -OutFile 'tentep-64_HieuckIT.exe'"
) else (
    powershell -Command "Invoke-WebRequest -Uri ''link32' -OutFile 'tentep-32_HieuckIT.exe'"
)

:: Install
echo Installing tenphanmem...
FOR %%i IN ("tentep*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\path\tenkill.exe" (
	echo Installation tenphanmem complete.
) else (
	echo Installation tenphanmem failed.
)
::License
::copy /y "banquyenneuco" "vaoday"

:: Clean up
del "tentep*.exe"
timeout /t 5
popd