# AI Custom Commands & Agents Repository

This repository centrally manages custom commands, agents, and skills for various AI tools including Gemini CLI, ClaudeCode, and OpenAI Codex.

## Directory Structure

- `gemini/`: Contains custom commands and configurations for Gemini CLI.
- `claude-code/`: Stores ClaudeCode agent definitions and prompts.
- `codex/`: Holds prompts, rules, and scripts for OpenAI Codex.

## Installation / Setup

You can use the provided `setup.sh` script to automatically symlink your global configurations (like Gemini commands).

```bash
./setup.sh
```

### ClaudeCode Agents
ClaudeCode agents are typically used on a per-project basis. To use an agent in your project, create a symlink from this repository to your project's `.claude/agents/` directory:

```bash
ln -sf /path/to/this/repo/claude-code/agents/my-agent.md /path/to/target-project/.claude/agents/
```
