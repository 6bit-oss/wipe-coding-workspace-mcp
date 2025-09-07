#!/bin/bash
# install-all.sh - Install dependencies for all MCP servers

echo "Installing dependencies for all MCP servers..."

# Install root dependencies
echo "Installing root dependencies..."
npm install

# Install Taskmaster dependencies
echo "Installing Taskmaster dependencies..."
cd mcp-servers/taskmaster
npm install
cd ../..

# Install Contex 7 dependencies
echo "Installing Contex 7 dependencies..."
cd mcp-servers/contex7
npm install
cd ../..

# Install Autodoc dependencies
echo "Installing Autodoc dependencies..."
cd mcp-servers/autodoc
npm install
cd ../..

echo "All dependencies installed successfully!"
