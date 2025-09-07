@echo off
REM start-all.bat - Start all MCP servers

echo Starting all MCP servers...

REM Start Taskmaster
echo Starting Taskmaster...
start "Taskmaster" cmd /k "cd mcp-servers\taskmaster && npm start"

REM Start Contex 7
echo Starting Contex 7...
start "Contex 7" cmd /k "cd mcp-servers\contex7 && npm start"

REM Start Autodoc
echo Starting Autodoc...
start "Autodoc" cmd /k "cd mcp-servers\autodoc && npm start"

echo All servers started in separate windows!
pause
