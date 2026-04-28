@echo off
setlocal enabledelayedexpansion
title R^&D Bigyanlabs - 1-Click Git Auto-Push Tool

:: Switch to the directory where the batch file is located
cd /d "%~dp0"

:MENU
cls
echo =======================================================
echo.
echo                 R^&D BIGYANLABS
echo           1-CLICK GIT AUTO-PUSH TOOL
echo.
echo =======================================================
echo Working Directory: %cd%
echo -------------------------------------------------------
echo.
echo Please select an option:
echo [1] Setup Git Repository (Run this first if not setup)
echo [2] Auto-Commit and Push ALL files
echo [3] Enable Git LFS for Large Files (Over 100MB)
echo [4] Exit
echo.
set /p choice="Enter a number and press Enter: "

if "%choice%"=="1" goto SETUP
if "%choice%"=="2" goto PUSH
if "%choice%"=="3" goto LFS
if "%choice%"=="4" goto EOF

goto MENU

:SETUP
cls
echo === Setup Git Repository ===
if exist ".git" (
    echo Git repository is already initialized here.
) else (
    git init
    echo Initialized empty Git repository.
)

echo.
echo Enter your Repository URL. 
echo (For private repos, use format: https://YOUR_TOKEN@github.com/Username/Repo.git)
set /p repo_url="URL: "

git remote remove origin 2>nul
git remote add origin !repo_url!
git branch -M main

echo.
echo Setup complete! You can now use Option 2 to push files.
pause
goto MENU

:PUSH
cls
echo === Auto-Pushing Files ===
if not exist ".git" (
    echo ERROR: Not a Git repository. Please run Setup (Option 1) first.
    pause
    goto MENU
)

:: Get current branch name
for /f "tokens=*" %%a in ('git branch --show-current') do set branch=%%a
if "!branch!"=="" set branch=main

echo 1. Staging files...
git add .

echo 2. Committing files...
:: Create a timestamped commit message
set ts=%date% %time%
git commit -m "Auto-commit: !ts!"

echo 3. Pushing to remote...
git push -u origin !branch!

echo.
if %errorlevel% equ 0 (
    echo SUCCESS: Files pushed successfully!
) else (
    echo ERROR: Failed to push files. Check your connection, token, or file sizes.
)
pause
goto MENU

:LFS
cls
echo === Setup Git LFS for Large Files ===
echo Git LFS is required for files larger than 100MB on GitHub.
git lfs install

echo Enter the file extension to track (e.g., *.zip, *.mp4, *.psd, *.iso)
echo Or type 'default' to track common large files automatically.
set /p ext="Extension: "

if /i "%ext%"=="default" (
    git lfs track "*.zip"
    git lfs track "*.rar"
    git lfs track "*.mp4"
    git lfs track "*.iso"
    git lfs track "*.psd"
    git lfs track "*.exe"
    git lfs track "*.dll"
    echo Tracking common large binaries.
) else (
    git lfs track "!ext!"
    echo Tracking !ext!
)

git add .gitattributes
git commit -m "Setup Git LFS tracking"
echo.
echo LFS setup complete! You can now push large files.
pause
goto MENU

:EOF
exit
