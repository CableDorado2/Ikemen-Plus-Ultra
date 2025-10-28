@echo off
setlocal
set os_type=windows
set OUTPUT_FILE=os_info.txt

:: Capture the output of the 'ver' command
FOR /F "tokens=*" %%a IN ('ver') DO set VER_OUTPUT=%%a

:: Search for the string "5.1" (Windows XP feature) in the output
echo %VER_OUTPUT% | find "5.1" > nul

:: Errorlevel 0 indicates that the string was found (it is XP)
if %errorlevel% equ 0 (
    set os_type=windowsXP
)

:: Print the final result to the text file.
echo %os_type% > %OUTPUT_FILE%

endlocal