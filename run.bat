@echo off & rem Don't write anything to console

rem Enable using variables in for loop
SETLOCAL EnableDelayedExpansion

rem Files variable to be populated with file names of pictures
set "files="

rem Current working directory = absolute path to this script
set "cwd=%~dp0%"

rem For each file with the selected extensions
for /r %%G in (*.jpg;*.jpeg;*.png) do (
    rem Get fully qualified path name of current file
    set "filePath=%%~fG"

    rem Get relative path by removing cwd from filePath.
    set "filePath=!filePath:*%cwd%=!"

    rem Add filePath to comma-separated string of files
    set "files=!files!,^"!filePath!^""
)

rem Add square brackets around comma-separated list, and remove first character which should be a comma.
set "files=var images = [%files:~1%];"

rem Change backslash to forward slash (windows path to web path)
set "files=!files:\=/!"

rem Write the string to file
echo %files% > images.js
echo Files written to 'images.js'

rem open index.html to view the files
echo Opening 'index.html' in browser
start .\index.html

ENDLOCAL
@echo on

