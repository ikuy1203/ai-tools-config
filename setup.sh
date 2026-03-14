#!/bin/bash

# Configuration
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI_TARGET_DIR="${HOME}/.gemini/commands"

echo "==============================================="
echo " AI Custom Commands Setup "
echo "==============================================="

# 1. Gemini CLI Setup
echo "[INFO] Setting up Gemini CLI commands..."
if [ -d "$REPO_DIR/gemini/commands" ]; then
    mkdir -p "$GEMINI_TARGET_DIR"
    for cmd in "$REPO_DIR/gemini/commands/"*.toml; do
        if [ -f "$cmd" ]; then
            filename=$(basename "$cmd")
            ln -sf "$cmd" "$GEMINI_TARGET_DIR/$filename"
            echo "  ✓ Symlinked: $filename -> $GEMINI_TARGET_DIR/$filename"
        fi
    done
else
    echo "  ! No Gemini commands found in $REPO_DIR/gemini/commands"
fi

# 2. ClaudeCode Setup
echo ""
echo "[INFO] ClaudeCode Setup"
echo "  ClaudeCode agents are typically installed per-project in '.claude/agents/'."
echo "  To install an agent into a specific project, run the following manually:"
echo ""
echo "    ln -sf $REPO_DIR/claude-code/agents/<AGENT_FILE>.md /path/to/project/.claude/agents/"
echo ""

# 3. Codex Setup
echo "[INFO] Codex Setup"
echo "  Codex files (prompts/scripts) can be referenced directly from:"
echo "    $REPO_DIR/codex/"
echo ""

echo "Setup Complete!"
