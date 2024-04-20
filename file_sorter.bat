@echo off
title Script by rodmutt on yt
color 2
echo note : Make sure to run this as administrator to avoid errors.
echo File Management Script

:: Batch Rename Files
echo Renaming files...
setlocal enabledelayedexpansion
set "counter=1"
for %%F in (*.txt) do (
    ren "%%F" "renamed!counter!.txt"
    set /a "counter+=1"
)
echo Files renamed.

:: Sort Files into Folders
echo Sorting files into folders...
for %%F in (*.*) do (
    if not "%%~xF"=="" (
        if not exist "%%~xF" mkdir "%%~xF"
        move "%%F" "%%~xF\"
    )
)
echo Files sorted into folders.

:: Find and Delete Duplicate Files
echo Finding and deleting duplicate files...
for %%F in (*.*) do (
    for %%G in (*.*) do (
        if "%%F" neq "%%G" (
            fc /b "%%F" "%%G" > nul
            if not errorlevel 1 (
                del "%%G"
            )
        )
    )
)
echo Duplicate files deleted.

echo File Management complete.
