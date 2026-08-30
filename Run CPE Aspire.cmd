@echo off
setlocal
cd /d "%~dp0"
dotnet run --project "%~dp0cpe\CPE.AppHost\CPE.AppHost.csproj" --launch-profile http %*
if errorlevel 1 (
  echo.
  echo The CPE Aspire host could not start.
  echo Install Python 3.10, Node.js, Go, and the .NET 8 SDK, then try again.
  pause
)
endlocal
