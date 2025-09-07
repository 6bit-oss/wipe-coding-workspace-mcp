# Cursor MCP Configuration Instructions

## Step 1: Open Cursor Settings
1. Open Cursor
2. Press Ctrl+, (or go to File > Preferences > Settings)
3. Search for "MCP" or "Model Context Protocol"

## Step 2: Add MCP Configuration
1. Find the MCP Servers section
2. Click "Add Server" or "Configure"
3. Copy the configuration from cursor-mcp-config.json

## Step 3: Configuration Content
Copy this configuration:

{
  "mcpServers": {
    "taskmaster": {
      "command": "node",
      "args": ["C:\\Users\\Thunderobot\\AppData\\Roaming\\Cursor\\User\\wipe-coding-workspace\\mcp-servers\\taskmaster\\dist\\index.js"],
      "env": {
        "NODE_ENV": "production"
      }
    },
    "contex7": {
      "command": "node",
      "args": ["C:\\Users\\Thunderobot\\AppData\\Roaming\\Cursor\\User\\wipe-coding-workspace\\mcp-servers\\contex7\\dist\\index.js"],
      "env": {
        "NODE_ENV": "production"
      }
    },
    "autodoc": {
      "command": "node",
      "args": ["C:\\Users\\Thunderobot\\AppData\\Roaming\\Cursor\\User\\wipe-coding-workspace\\mcp-servers\\autodoc\\dist\\index.js"],
      "env": {
        "NODE_ENV": "production"
      }
    }
  }
}

## Step 4: Restart Cursor
After adding the configuration, restart Cursor to load the MCP servers.

## Step 5: Test the Servers
Once Cursor restarts, you should see the MCP servers available:
- Taskmaster: Task management and decomposition
- Contex 7: Documentation and context loading
- Autodoc: Automatic documentation generation
