@echo off
REM build-all.bat - Build all MCP servers

echo Building all MCP servers...

REM Build Taskmaster
echo Building Taskmaster...
cd mcp-servers\taskmaster
npm run build
cd ..\..

REM Build Contex 7
echo Building Contex 7...
cd mcp-servers\contex7
npm run build
cd ..\..

REM Build Autodoc
echo Building Autodoc...
cd mcp-servers\autodoc
npm run build
cd ..\..

echo All servers built successfully!
pause
