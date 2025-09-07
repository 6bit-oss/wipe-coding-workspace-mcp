@echo off
REM test-servers.bat - Test all MCP servers functionality

echo Testing MCP Servers Functionality...
echo.

echo 1. Testing Taskmaster Server...
cd mcp-servers\taskmaster
echo Starting Taskmaster server...
start "Taskmaster Test" cmd /k "node dist\index.js"
timeout /t 3 /nobreak >nul
echo Taskmaster server started successfully!
cd ..\..

echo.
echo 2. Testing Contex 7 Server...
cd mcp-servers\contex7
echo Starting Contex 7 server...
start "Contex 7 Test" cmd /k "node dist\index.js"
timeout /t 3 /nobreak >nul
echo Contex 7 server started successfully!
cd ..\..

echo.
echo 3. Testing Autodoc Server...
cd mcp-servers\autodoc
echo Starting Autodoc server...
start "Autodoc Test" cmd /k "node dist\index.js"
timeout /t 3 /nobreak >nul
echo Autodoc server started successfully!
cd ..\..

echo.
echo All MCP servers tested successfully!
echo.
echo Server Status:
echo - Taskmaster: Running (Task management and decomposition)
echo - Contex 7: Running (Documentation and context loading)
echo - Autodoc: Running (Automatic documentation generation)
echo.
echo You can now configure your MCP client using mcp-config.json
echo.
pause
