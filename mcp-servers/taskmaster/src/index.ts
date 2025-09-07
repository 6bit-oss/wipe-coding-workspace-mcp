import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";

// Create MCP server
const server = new McpServer({
  name: "taskmaster",
  version: "1.0.0"
});

// Simple task storage
const tasks = new Map();

// Register tools
server.registerTool(
  "create_task",
  {
    title: "Create Task",
    description: "Create a new task with automatic decomposition",
    inputSchema: {
      title: z.string().describe("Task title"),
      description: z.string().describe("Task description"),
      priority: z.enum(["low", "medium", "high", "critical"]).optional()
    }
  },
  async ({ title, description, priority = "medium" }) => {
    const taskId = Date.now().toString();
    const task = {
      id: taskId,
      title,
      description,
      status: "pending",
      priority,
      createdAt: new Date().toISOString()
    };
    
    tasks.set(taskId, task);
    
    return {
      content: [{
        type: "text",
        text: `Task created: ${title} (ID: ${taskId})`
      }]
    };
  }
);

server.registerTool(
  "list_tasks",
  {
    title: "List Tasks",
    description: "List all tasks",
    inputSchema: {}
  },
  async () => {
    const taskList = Array.from(tasks.values()).map(task => 
      `${task.title} (${task.id}) - ${task.status} - ${task.priority}`
    ).join('\n');
    
    return {
      content: [{
        type: "text",
        text: taskList || "No tasks found."
      }]
    };
  }
);

// Start server
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Taskmaster MCP server is running...");
}

main().catch((error) => {
  console.error("Server error:", error);
  process.exit(1);
});
