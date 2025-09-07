@echo off
REM restart-cursor.bat - Restart Cursor to load MCP configuration

echo Restarting Cursor to load MCP configuration...
echo.

echo Stopping Cursor processes...
taskkill /f /im "Cursor.exe" 2>nul

echo Waiting for processes to stop...
timeout /t 3 /nobreak >nul

echo Starting Cursor...
start "" "C:\Users\Thunderobot\AppData\Local\Programs\cursor\Cursor.exe"

echo.
echo Cursor restarted successfully!
echo MCP servers should now be available in Cursor.
echo.
echo Available MCP servers:
echo - Taskmaster: Task management and decomposition
echo - Contex 7: Documentation and context loading
echo - Autodoc: Automatic documentation generation
echo.
pause
