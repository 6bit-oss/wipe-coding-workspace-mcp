# Wipe Coding Workspace - Code Map

## Project Overview
This is a comprehensive wipe-coding workspace with neural network integration, featuring MCP (Model Context Protocol) servers for task management, documentation, and context loading.

## Project Structure
```
wipe-coding-workspace/
 .gitignore                 # Git ignore rules
 package.json              # Root package configuration
 src/                      # Main source code
 mcp-servers/              # MCP server implementations
    taskmaster/           # Task decomposition and tracking
    contex7/              # Context and documentation loading
    autodoc/              # Automatic documentation generation
 docs/                     # Project documentation
 scripts/                  # Utility scripts
 README.md                 # Project readme
```

## Technology Stack

### Core Technologies
- **Node.js**: Runtime environment
- **TypeScript**: Primary programming language
- **MCP (Model Context Protocol)**: Communication protocol for AI integration
- **Zod**: Schema validation
- **Git**: Version control

### MCP Servers
1. **Taskmaster Server** (`mcp-servers/taskmaster/`)
   - Automatic task decomposition
   - Progress tracking
   - Task status management
   - Subtask creation

2. **Contex 7 Server** (`mcp-servers/contex7/`)
   - Documentation loading
   - Code example generation
   - Context analysis
   - Library documentation caching

3. **Autodoc Server** (`mcp-servers/autodoc/`)
   - Automatic documentation generation
   - JSDoc/TSDoc support
   - Markdown documentation
   - Code analysis

## Architecture Patterns

### MCP Server Pattern
Each MCP server follows a consistent pattern:
```typescript
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";

const server = new McpServer({
  name: "server-name",
  version: "1.0.0"
});

// Register tools and resources
server.registerTool(/* ... */);
server.registerResource(/* ... */);

// Start server
const transport = new StdioServerTransport();
await server.connect(transport);
```

### Tool Registration Pattern
```typescript
server.registerTool(
  "tool_name",
  {
    title: "Tool Title",
    description: "Tool description",
    inputSchema: {
      param1: z.string().describe("Parameter description"),
      param2: z.number().optional().describe("Optional parameter")
    }
  },
  async ({ param1, param2 }) => {
    // Tool implementation
    return {
      content: [{
        type: "text",
        text: "Result"
      }]
    };
  }
);
```

## Key Features

### Task Management (Taskmaster)
- **Automatic Decomposition**: Breaks down complex tasks into subtasks
- **Progress Tracking**: Monitors task completion status
- **Priority Management**: Handles task priorities (low, medium, high, critical)
- **Dependency Management**: Manages task dependencies
- **Status Updates**: Tracks task status changes

### Context Loading (Contex 7)
- **Documentation Caching**: Caches library documentation
- **Code Examples**: Provides relevant code examples
- **Context Analysis**: Analyzes code for relevant documentation
- **Library Support**: Supports popular libraries (React, TypeScript, Node.js)

### Documentation Generation (Autodoc)
- **Multiple Formats**: Supports Markdown, JSDoc, and TSDoc
- **Code Analysis**: Analyzes code structure and patterns
- **Automatic Generation**: Generates documentation from code
- **Language Support**: Supports multiple programming languages

## Configuration

### TypeScript Configuration
All servers use consistent TypeScript configuration:
```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "node",
    "esModuleInterop": true,
    "strict": true,
    "outDir": "./dist",
    "rootDir": "./src"
  }
}
```

### Package Configuration
Each server has its own package.json with:
- MCP SDK dependency
- Zod for validation
- TypeScript for development
- tsx for development server

## Usage Examples

### Creating a Task
```typescript
// Using Taskmaster server
const result = await taskmaster.create_task({
  title: "Setup React project",
  description: "Create a new React application with TypeScript",
  priority: "high"
});
```

### Loading Documentation
```typescript
// Using Contex 7 server
const docs = await contex7.load_documentation({
  library: "react",
  version: "18.0.0",
  topic: "hooks"
});
```

### Generating Documentation
```typescript
// Using Autodoc server
const docs = await autodoc.generate_docs({
  code: "function example() { return 'hello'; }",
  language: "javascript",
  format: "jsdoc"
});
```

## Development Workflow

1. **Setup**: Install dependencies for each server
2. **Development**: Use `npm run dev` for development mode
3. **Build**: Use `npm run build` to compile TypeScript
4. **Start**: Use `npm start` to run the compiled server
5. **Testing**: Test servers using MCP Inspector

## Integration Points

### Git Integration
- Automatic commits after task completion
- Branch management for feature development
- Pull request automation

### MCP Client Integration
- Claude Desktop integration
- VS Code MCP extension support
- Custom MCP client support

## Future Enhancements

1. **Database Integration**: Add persistent storage for tasks and documentation
2. **Web Interface**: Create a web-based dashboard
3. **API Endpoints**: Add REST API for external integration
4. **Plugin System**: Allow custom tool and resource plugins
5. **Analytics**: Add usage analytics and reporting

## Security Considerations

- Input validation using Zod schemas
- Error handling and logging
- Secure data storage
- Access control for sensitive operations

## Performance Optimizations

- Documentation caching in Contex 7
- Lazy loading of resources
- Efficient task storage
- Minimal memory footprint

## Troubleshooting

### Common Issues
1. **Server Connection**: Ensure MCP client is properly configured
2. **TypeScript Errors**: Check tsconfig.json configuration
3. **Dependencies**: Run `npm install` in each server directory
4. **Port Conflicts**: Check for port conflicts in development

### Debug Mode
Enable debug mode by setting environment variable:
```bash
DEBUG=mcp:* npm run dev
```

## Contributing

1. Follow TypeScript best practices
2. Add proper error handling
3. Include JSDoc comments
4. Test with MCP Inspector
5. Update documentation

## License
MIT License - See LICENSE file for details
