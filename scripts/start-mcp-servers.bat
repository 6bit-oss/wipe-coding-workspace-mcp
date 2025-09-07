@echo off
REM start-mcp-servers.bat - Start all MCP servers for Cursor integration

echo Starting MCP Servers for Cursor Integration...
echo.

echo Starting Taskmaster Server...
start "Taskmaster MCP Server" cmd /k "cd /d C:\Users\Thunderobot\AppData\Roaming\Cursor\User\wipe-coding-workspace\mcp-servers\taskmaster && node dist\index.js"

echo Starting Contex 7 Server...
start "Contex 7 MCP Server" cmd /k "cd /d C:\Users\Thunderobot\AppData\Roaming\Cursor\User\wipe-coding-workspace\mcp-servers\contex7 && node dist\index.js"

echo Starting Autodoc Server...
start "Autodoc MCP Server" cmd /k "cd /d C:\Users\Thunderobot\AppData\Roaming\Cursor\User\wipe-coding-workspace\mcp-servers\autodoc && node dist\index.js"

echo.
echo All MCP servers started successfully!
echo.
echo Server Status:
echo - Taskmaster: Running on stdio
echo - Contex 7: Running on stdio  
echo - Autodoc: Running on stdio
echo.
echo Now configure Cursor with the MCP configuration:
echo 1. Open Cursor Settings (Ctrl+,)
echo 2. Search for "MCP" or "Model Context Protocol"
echo 3. Add the configuration from cursor-mcp-config.json
echo 4. Restart Cursor
echo.
echo Configuration file: cursor-mcp-config.json
echo.
pause
