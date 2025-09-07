# Wipe Coding Workspace

A comprehensive development environment for wipe-coding with neural network integration, featuring MCP (Model Context Protocol) servers for enhanced productivity.

## Features

- **Task Management**: Automatic task decomposition and progress tracking
- **Context Loading**: Intelligent documentation and example loading  
- **Auto-Documentation**: Automatic code documentation generation
- **MCP Integration**: Full Model Context Protocol support
- **TypeScript**: Modern TypeScript development environment

## Project Structure

```
wipe-coding-workspace/
 mcp-servers/              # MCP server implementations
    taskmaster/           # Task decomposition and tracking
    contex7/              # Context and documentation loading
    autodoc/              # Automatic documentation generation
 src/                      # Main source code
 docs/                     # Project documentation
 scripts/                  # Utility scripts
 CODE_MAP.md              # Detailed code map and architecture
 README.md                # This file
```

## Quick Start

### Prerequisites
- Node.js 18+ 
- npm or yarn
- Git

### Installation

1. **Clone the repository**:
   ```bash
   git clone <your-repo-url>
   cd wipe-coding-workspace
   ```

2. **Install root dependencies**:
   ```bash
   npm install
   ```

3. **Install MCP server dependencies**:
   ```bash
   # Taskmaster server
   cd mcp-servers/taskmaster
   npm install
   
   # Contex 7 server
   cd ../contex7
   npm install
   
   # Autodoc server
   cd ../autodoc
   npm install
   ```

## MCP Servers

### 1. Taskmaster Server
**Location**: `mcp-servers/taskmaster/`

**Features**:
- Automatic task decomposition into subtasks
- Progress tracking and status management
- Priority handling (low, medium, high, critical)
- Task dependency management

### 2. Contex 7 Server
**Location**: `mcp-servers/contex7/`

**Features**:
- Documentation caching and loading
- Code example generation
- Context analysis for libraries
- Support for popular frameworks

### 3. Autodoc Server
**Location**: `mcp-servers/autodoc/`

**Features**:
- Automatic documentation generation
- Multiple format support (Markdown, JSDoc, TSDoc)
- Code analysis and pattern recognition
- Multi-language support

## License
MIT License - see LICENSE file for details.
