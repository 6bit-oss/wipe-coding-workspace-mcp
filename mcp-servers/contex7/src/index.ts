import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";

const server = new McpServer({
  name: "contex7",
  version: "1.0.0"
});

const docCache = new Map();

server.registerTool(
  "load_documentation",
  {
    title: "Load Documentation",
    description: "Load documentation for a library",
    inputSchema: {
      library: z.string().describe("Library name"),
      version: z.string().optional().describe("Version")
    }
  },
  async ({ library, version }) => {
    const cacheKey = `${library}${version ? `@${version}` : ''}`;
    
    if (docCache.has(cacheKey)) {
      return {
        content: [{
          type: "text",
          text: `Documentation for ${library}:\n\n${docCache.get(cacheKey)}`
        }]
      };
    }
    
    const mockDocs = `# ${library} Documentation\n\nThis is mock documentation for ${library}${version ? ` v${version}` : ''}.\n\n## Features\n- Feature 1\n- Feature 2\n- Feature 3\n\n## Usage\n\`\`\`javascript\n// Example usage\nconst example = new ${library}();\n\`\`\``;
    
    docCache.set(cacheKey, mockDocs);
    
    return {
      content: [{
        type: "text",
        text: `Documentation loaded for ${library}:\n\n${mockDocs}`
      }]
    };
  }
);

async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Contex 7 MCP server is running...");
}

main().catch((error) => {
  console.error("Server error:", error);
  process.exit(1);
});
