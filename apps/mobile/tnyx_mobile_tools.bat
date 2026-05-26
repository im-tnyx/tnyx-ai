@echo off
setlocal EnableExtensions EnableDelayedExpansion
title TNYX Mobile Tools

set "PROJECT_DIR=%~dp0"
set "FLUTTER_BIN=G:\dev\flutter-sdk\flutter\bin"
set "ADB_BIN=C:\Users\SANTOSH\AppData\Local\Android\sdk\platform-tools"
set "PATH=%FLUTTER_BIN%;%ADB_BIN%;%PATH%"

if exist "G:\pub-cache" (
  set "PUB_CACHE=G:\pub-cache"
)

pushd "%PROJECT_DIR%"

:menu
cls
echo ======================================
echo   TNYX Mobile - Debug Menu
echo ======================================
echo [1] Check setup
echo [2] Install + Run Debug app
echo [3] Hot Reload live session	  	- use r, R, q during run
echo [4] Auto Hot Reload on Save live session	- save Dart file to auto send hot reload  
echo [5] Layout Debug session			- use p, w, t, P, q during run
echo [0] Exit
echo.
set /p CHOICE=Select option number: 

if "%CHOICE%"=="1" goto check_setup
if "%CHOICE%"=="2" goto install_run
if "%CHOICE%"=="3" goto hot_reload
if "%CHOICE%"=="4" goto auto_hot_reload
if "%CHOICE%"=="5" goto layout_debug
if "%CHOICE%"=="0" goto done

echo.
echo Invalid option. Try again.
pause
goto menu

:check_setup
cls
echo [Check] Flutter and ADB
echo.
where flutter
where adb
echo.
flutter --version
echo.
adb devices -l
echo.
flutter doctor -v
echo.
pause
goto menu

:pick_device
set "DEVICE_ID="
set /p DEVICE_ID=Enter device id (blank = auto detect first device): 
if not "%DEVICE_ID%"=="" goto pick_device_done

for /f "skip=1 tokens=1,2" %%A in ('adb devices') do (
  if "%%B"=="device" if not defined DEVICE_ID set "DEVICE_ID=%%A"
)

:pick_device_done
if "%DEVICE_ID%"=="" (
  echo.
  echo No online device found.
  echo Check USB debugging and run: adb devices -l
  echo.
  pause
  goto menu
)
exit /b 0

:install_run
cls
call :pick_device
if errorlevel 1 goto menu
echo.
echo Using device: %DEVICE_ID%
echo.
flutter pub get
if errorlevel 1 goto run_failed
flutter run --debug -d %DEVICE_ID%
goto run_end

:hot_reload
cls
call :pick_device
if errorlevel 1 goto menu
echo.
echo Starting live session on: %DEVICE_ID%
echo Hot reload keys while app is running:
echo   r = hot reload
echo   R = hot restart
echo   q = quit session
echo.
flutter run --debug -d %DEVICE_ID%
goto run_end

:auto_hot_reload
cls
call :pick_device
if errorlevel 1 goto menu
echo.
echo Starting auto hot reload session on: %DEVICE_ID%
echo Save any Dart file under lib\ and auto hot reload will trigger.
echo Press q in Flutter terminal to stop session.
echo.
if not exist "%PROJECT_DIR%scripts\auto_hot_reload.ps1" (
  echo Auto reload script not found: %PROJECT_DIR%scripts\auto_hot_reload.ps1
  pause
  goto menu
)
if defined DEVICE_ID (
  powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%PROJECT_DIR%scripts\auto_hot_reload.ps1" -ProjectDir "%PROJECT_DIR%" -DeviceId "%DEVICE_ID%"
) else (
  powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%PROJECT_DIR%scripts\auto_hot_reload.ps1" -ProjectDir "%PROJECT_DIR%"
)
goto run_end

:layout_debug
cls
call :pick_device
if errorlevel 1 goto menu
echo.
echo Starting layout debug session on: %DEVICE_ID%
echo Useful runtime commands:
echo   p = toggle debug paint (layout boundaries)
echo   w = dump widget tree
echo   t = dump render tree
echo   P = toggle performance overlay
echo   q = quit session
echo.
flutter run --debug -d %DEVICE_ID%
goto run_end

:run_failed
echo.
echo Build failed. Run option [1] and verify toolchain.
echo.
pause
goto menu

:run_end
echo.
echo Session ended.
echo.
pause
goto menu

:done
popd
endlocal
exit /b 0
