@echo off
Title Findout the files with certain extension, add them to an arry and show them. 
REM this FileFolderDir path should be change according to your folder path
set "FileFolderDir=%F:\learning\Library%"  
Set LogFile=%~dpn0.txt
If exist "%LogFile%" Del "%LogFile%"
REM Iterates throw all text files on %FileFolderDir% and its subfolders.
REM And Populate the array with existent files in this folder and its subfolders
echo     Please wait, 
SetLocal EnableDelayedexpansion
@FOR /f "delims=" %%f IN ('dir /b "%FileFolderDir%\*.jar"') DO (    REM for getting jar file from subdirectory dir /b /s "%FileFolderDir%\*.jar
    set /a "idx+=1"
    set "FileName[!idx!]=%%~nf" REM file name without extension. For with extension, we need to use:  %%~nxf
    set "FilePath[!idx!]=%%~dpFf"
)

REM Display array elements
for /L %%i in (1,1,%idx%) do (
    echo [%%i] "!FileName[%%i]!"
    ( 
	    call mvn install:install-file -Dfile="!FilePath[%%i]!"  -DgroupId=com.yourcompany.lib -DartifactId="!FileName[%%i]!"  -Dversion=1.0 -Dpackaging=jar
        echo( File name: [%%i] "!FileName[%%i]!"
        echo Path : "!FilePath[%%i]!"
    )>> "%LogFile%"
)

ECHO(
ECHO Total text files(s) : !idx!
TimeOut /T 10 /nobreak>nul
Start "" "%LogFile%"