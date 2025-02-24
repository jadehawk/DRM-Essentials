@echo off
rem This batch file will replace the updates directory in the AppData\Local\Amazon\Kindle\ directory
rem with a file called updates to block updates being downloaded correctly
set KINDLE=%LocalAppData%\Amazon\Kindle
set KINDLE_EXE=%PROGRAMFILES(X86)%\Amazon\Kindle
rem The two test below look for the kindle.exe executable in the Program Files (x86) if it was installed for multiple
rem users by running the installer as administrator or in the AppDataAppData\Local\Amazon\Kindle\ using a normal install.
if exist "%KINDLE_EXE%\Kindle.exe" goto :found
if not exist "%KINDLE%\application\Kindle.exe" goto :nokindle
:found
if exist "%KINDLE%\updates" rmdir /S /Q "%KINDLE%\updates"
rem create an updates file to replace the updates directory
echo This file disables Kindle for PC downloads. > "%KINDLE%\updates"
echo Kindle for PC downloads are now disabled
goto :exit
:nokindle
echo Cannot disable downloads - Kindle for PC is not installed at expected location
:exit
pause