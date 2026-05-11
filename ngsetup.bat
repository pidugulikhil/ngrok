@echo off
cls
echo DO YOU WANT TO CONTINUE [Y/N] :
set /p n="> "
if /i "%n%"=="y" (
    cls
    echo LOADING
    for /l %%i in (1,1,3) do (
        <nul set /p =". "
        timeout /t 1 /nobreak >nul
    )
    cls
) else (
    exit /b
)

echo CHOOSE YOUR SYSTEM TYPE
echo.
echo  1. WINDOWS (64-bit)      2. WINDOWS (32-bit)
echo.
set /p choice="> "

if "%choice%"=="1" goto win64
if /i "%choice%"=="windows" goto win64
if "%choice%"=="2" goto win32
if /i "%choice%"=="windows32" goto win32

echo INVALID CHOICE. EXITING.
pause
exit /b

:win64
echo.
echo INPUT YOUR AUTHTOKEN :
set /p auth="> "
echo.
echo Downloading ngrok for Windows 64-bit...
curl -L -o ngrok.zip "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip"
if errorlevel 1 (
    echo DOWNLOAD FAILED. CHECK YOUR INTERNET CONNECTION.
    pause
    exit /b
)
timeout /t 2 /nobreak >nul

echo Extracting...
powershell -Command "Expand-Archive -Path 'ngrok.zip' -DestinationPath '.' -Force"
if errorlevel 1 (
    echo EXTRACTION FAILED.
    pause
    exit /b
)
timeout /t 1 /nobreak >nul

echo Configuring authtoken...
ngrok.exe config add-authtoken %auth%
timeout /t 2 /nobreak >nul

echo Copying ngrok to System32...
copy /y ngrok.exe C:\Windows\System32\ngrok.exe >nul
if errorlevel 1 (
    echo FAILED TO COPY TO SYSTEM32. TRY RUNNING AS ADMINISTRATOR.
    echo Alternatively, ngrok.exe is available in the current directory.
    pause
    exit /b
)
timeout /t 1 /nobreak >nul

echo.
echo SUCCESSFULLY NGROK INSTALLED ON WINDOWS (64-bit)
echo ENVIRONMENT VARIABLE SETUP COMPLETE
echo YOU CAN RUN NGROK FROM ANY TERMINAL NOW...
goto cleanup

:win32
echo.
echo INPUT YOUR AUTHTOKEN :
set /p auth="> "
echo.
echo Downloading ngrok for Windows 32-bit...
curl -L -o ngrok.zip "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-386.zip"
if errorlevel 1 (
    echo DOWNLOAD FAILED. CHECK YOUR INTERNET CONNECTION.
    pause
    exit /b
)
timeout /t 2 /nobreak >nul

echo Extracting...
powershell -Command "Expand-Archive -Path 'ngrok.zip' -DestinationPath '.' -Force"
if errorlevel 1 (
    echo EXTRACTION FAILED.
    pause
    exit /b
)
timeout /t 1 /nobreak >nul

echo Configuring authtoken...
ngrok.exe config add-authtoken %auth%
timeout /t 2 /nobreak >nul

echo Copying ngrok to System32...
copy /y ngrok.exe C:\Windows\System32\ngrok.exe >nul
if errorlevel 1 (
    echo FAILED TO COPY TO SYSTEM32. TRY RUNNING AS ADMINISTRATOR.
    echo Alternatively, ngrok.exe is available in the current directory.
    pause
    exit /b
)
timeout /t 1 /nobreak >nul

echo.
echo SUCCESSFULLY NGROK INSTALLED ON WINDOWS (32-bit)
echo ENVIRONMENT VARIABLE SETUP COMPLETE
echo YOU CAN RUN NGROK FROM ANY TERMINAL NOW...

:cleanup
del /f /q ngrok.zip >nul 2>&1
echo.
pause
