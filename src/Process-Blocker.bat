:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off
mode 40,30
title Process-Blocker
echo Process-Blocker by hXR16F

echo Initializing...
setlocal EnableDelayedExpansion
if exist "input.ini" (
	set line=1
	for /f "tokens=1*" %%i in (input.ini) do (
		if "!line!" equ "1" set "processName=%%i"
		if "!line!" equ "2" set "errorMessage=%%i"
		if "!line!" equ "3" set "delay=%%i"
		set /a line+=1
	)
	del /f /q "input.ini" >nul 2>&1
) else (
	set "processName=%~1"
	set "errorMessage=%2"
	set "delay=%3"
)
(echo  + %processName%&echo  + %errorMessage%&echo  + %delay%)
if "%errorMessage%" equ "1" (
	echo x = msgbox^("Windows cannot find '%processName%'. Make sure you typed the name correctly, and then try again.", 0+16, "%processName%"^)> "Process-Blocker.vbs"
)

echo Started^^!
:loop
	taskkill /f /im %processName% >nul 2>&1 && (
		echo  + Killed^^!
		if "%errorMessage%" equ "1" start "" "Process-Blocker.vbs"
	)
	timeout /t %delay% > nul
	goto :loop
	