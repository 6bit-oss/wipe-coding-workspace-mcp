@echo off
echo Starting MCP Servers in Background Mode...

echo Starting Taskmaster Server in background...
start /B cmd /c "cd /d C:\Users\Thunderobot\AppData\Roaming\Cursor\User\wipe-coding-workspace\mcp-servers\taskmaster && node dist\index.js > nul 2>&1"

echo Starting Contex 7 Server in background...
start /B cmd /c "cd /d C:\Users\Thunderobot\AppData\Roaming\Cursor\User\wipe-coding-workspace\mcp-servers\contex7 && node dist\index.js > nul 2>&1"

echo Starting Autodoc Server in background...
start /B cmd /c "cd /d C:\Users\Thunderobot\AppData\Roaming\Cursor\User\wipe-coding-workspace\mcp-servers\autodoc && node dist\index.js > nul 2>&1"

echo All MCP servers started in background mode!
echo No console windows will be visible.
echo.
echo To stop servers, run: taskkill /f /im node.exe
pause
