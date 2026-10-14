@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title DarsYar - Windows EXE Builder

echo ============================================================
echo                 DarsYar EXE Builder
echo ============================================================
echo Project: %CD%
echo.

set "PY=%~dp0.venv\Scripts\python.exe"
set "ICON=%~dp0assets\DarsYar.ico"

if not exist "%PY%" (
    echo ERROR: Python virtual environment was not found:
    echo   %PY%
    echo.
    echo Create .venv and install the project requirements first.
    pause
    exit /b 1
)

if not exist "%ICON%" (
  echo [ERROR] App icon not found: assets\DarsYar.ico
  echo Put your logo in assets\DarsYar.ico before building.
  echo Recommended: also keep a transparent PNG at assets\DarsYar.png for the app UI/favicon.
  pause
  exit /b 1
)

if not exist "launcher.py" (
    echo ERROR: launcher.py was not found in the project folder.
    pause
    exit /b 1
)

if not exist "app\main.py" (
    echo ERROR: app\main.py was not found. Check the project folder.
    pause
    exit /b 1
)

echo [1/6] Checking Python environment...
"%PY%" --version
if errorlevel 1 goto error

echo.
echo [2/6] Installing/updating dependencies from requirements.txt...
if exist "requirements.txt" (
    "%PY%" -m pip install --upgrade -r requirements.txt
    if errorlevel 1 (
        echo ERROR: Could not install requirements.txt.
        goto error
    )
) else (
    echo WARNING: requirements.txt was not found; skipping dependency installation.
)

echo.
echo [3/6] Installing PyInstaller...
"%PY%" -m pip install --upgrade pyinstaller
if errorlevel 1 goto error

echo.
echo [4/6] Verifying required imports...
"%PY%" -c "import fastapi, starlette, uvicorn, sqlite3, _sqlite3, sqlcipher3; from sqlcipher3 import dbapi2; import itsdangerous, multipart, openpyxl; print('All required imports passed.'); print('SQLite:', sqlite3.sqlite_version)"
if errorlevel 1 (
    echo.
    echo ERROR: A required package cannot be imported in .venv.
    echo Fix the environment/import error above before packaging.
    goto error
)

echo.
echo [5/6] Closing a previous DarsYar process, if one is running...
taskkill /F /IM DarsYar.exe >nul 2>&1

echo Removing previous build output...
if exist "dist\DarsYar" rmdir /S /Q "dist\DarsYar"
if exist "build\DarsYar" rmdir /S /Q "build\DarsYar"
if exist "DarsYar.spec" del /F /Q "DarsYar.spec"

if exist "dist\DarsYar" (
    echo ERROR: dist\DarsYar is still locked by another process.
    echo Close Explorer windows or restart Windows, then run this file again.
    goto error
)
if exist "build\DarsYar" (
    echo ERROR: build\DarsYar could not be removed.
    goto error
)

echo.
echo [6/6] Building DarsYar with standard SQLite and SQLCipher support...
"%PY%" -m PyInstaller ^
    --noconfirm ^
    --clean ^
    --onedir ^
    --name DarsYar ^
    --distpath "dist" ^
    --icon "%ICON%" ^
    --workpath "build" ^
    --specpath "." ^
    --add-data "app;app" ^
    --hidden-import sqlite3 ^
    --hidden-import _sqlite3 ^
    --collect-submodules sqlite3 ^
    --hidden-import sqlcipher3 ^
    --hidden-import sqlcipher3.dbapi2 ^
    --collect-all sqlcipher3 ^
    --collect-all fastapi ^
    --collect-all starlette ^
    --collect-all uvicorn ^
    --collect-all itsdangerous ^
    --collect-all openpyxl ^
    --collect-all multipart ^
    launcher.py

if errorlevel 1 goto error

if not exist "dist\DarsYar\DarsYar.exe" (
    echo ERROR: PyInstaller finished but DarsYar.exe was not found.
    goto error
)

echo.
echo ============================================================
echo BUILD SUCCEEDED
echo Executable: %CD%\dist\DarsYar\DarsYar.exe
echo.
echo IMPORTANT:
echo 1. Test this EXE from CMD.
echo 2. Keep the entire dist\DarsYar folder together.
echo 3. Do not copy only DarsYar.exe; the _internal folder is needed.
echo 4. This build has not yet been tested on a clean PC.
echo ============================================================
pause
exit /b 0

:error
echo.
echo ============================================================
echo BUILD FAILED
echo Read the first error above. Do not run an older EXE and assume
echo it is the newly built version.
echo ============================================================
pause
exit /b 1
