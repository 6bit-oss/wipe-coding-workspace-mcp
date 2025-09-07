import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";

const server = new McpServer({
  name: "autodoc",
  version: "1.0.0"
});

server.registerTool(
  "generate_docs",
  {
    title: "Generate Documentation",
    description: "Generate documentation for code",
    inputSchema: {
      code: z.string().describe("Code to document"),
      language: z.string().describe("Programming language"),
      format: z.enum(["markdown", "jsdoc", "tsdoc"]).optional().describe("Documentation format")
    }
  },
  async ({ code, language, format = "markdown" }) => {
    const docs = generateDocumentation(code, language, format);
    
    return {
      content: [{
        type: "text",
        text: `Generated ${format} documentation:\n\n${docs}`
      }]
    };
  }
);

function generateDocumentation(code: string, language: string, format: string): string {
  if (format === "jsdoc" || format === "tsdoc") {
    return generateJSDoc(code, language);
  }
  
  return generateMarkdownDocs(code, language);
}

function generateJSDoc(code: string, language: string): string {
  return `/**
 * Auto-generated documentation for ${language} code
 * 
 * @description This function was automatically documented
 * @param {string} input - The input parameter
 * @returns {string} The processed result
 * @throws {Error} When input is invalid
 * @example
 * const result = exampleFunction("test");
 * console.log(result);
 */
${code}`;
}

function generateMarkdownDocs(code: string, language: string): string {
  return `# ${language} Code Documentation

## Overview
This document contains auto-generated documentation for the provided ${language} code.

## Code
\`\`\`${language}
${code}
\`\`\`

## Analysis
- **Language**: ${language}
- **Lines of Code**: ${code.split('\n').length}
- **Functions**: ${(code.match(/function|=>/g) || []).length}
- **Classes**: ${(code.match(/class/g) || []).length}

## Generated Documentation
This code appears to be a ${language} implementation. Please review and add specific documentation as needed.`;
}

async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Autodoc MCP server is running...");
}

main().catch((error) => {
  console.error("Server error:", error);
  process.exit(1);
});
