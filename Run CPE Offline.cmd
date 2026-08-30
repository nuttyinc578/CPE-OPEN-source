@echo off
setlocal
cd /d "%~dp0"
py -3.10 "%~dp0CPE.py" --offline %*
if errorlevel 1 (
  echo.
  echo CPE could not start. Make sure Python 3.10, pygame, and pymunk are installed.
  pause
)
endlocal
