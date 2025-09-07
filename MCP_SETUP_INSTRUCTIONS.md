# MCP Client Configuration Instructions

## For Claude Desktop

1. Open Claude Desktop
2. Go to Settings > MCP Servers
3. Add the following configuration:

```json
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
```

## For VS Code

1. Install MCP extension for VS Code
2. Open Command Palette (Ctrl+Shift+P)
3. Run "MCP: Open Configuration"
4. Add the same configuration as above

## For Cursor

1. Open Cursor settings
2. Go to MCP configuration
3. Add the configuration from mcp-config.json

## Testing the Configuration

After adding the configuration, restart your MCP client and test the servers:

1. **Taskmaster**: Try creating a task
2. **Contex 7**: Try loading documentation
3. **Autodoc**: Try generating documentation

All servers should be accessible through your MCP client interface.
