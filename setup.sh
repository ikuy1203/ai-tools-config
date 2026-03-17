#!/bin/bash
set -euo pipefail

# Configuration
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI_TARGET_DIR="${HOME}/.gemini/commands"

# Logging Utilities
log_info() { printf "\n\033[1;34m[INFO]\033[0m %s\n" "$1"; }    # 青色
log_success() { printf "  \033[1;32m✓\033[0m %s\n" "$1"; }      # 緑色
log_warn() { printf "  \033[1;33m!\033[0m %s\n" "$1"; }         # 黄色

# 汎用的なシンボリックリンク作成関数
link_commands() {
    local src_dir="$1"
    local target_dir="$2"
    local extension="$3"

    if [[ ! -d "$src_dir" ]]; then
        log_warn "Directory not found: $src_dir"
        return 0
    fi

    mkdir -p "$target_dir"

    # サブシェル内で shopt を変更することで、呼び出し元の設定に影響を与えない
    (
        shopt -s nullglob
        local files=("$src_dir"/*."$extension")
        
        if [ ${#files[@]} -eq 0 ]; then
            log_warn "No .$extension files found in $src_dir"
        else
            for f in "${files[@]}"; do
                local filename="${f##*/}"
                local target="$target_dir/$filename"

                if [[ -L "$target" && "$(readlink -- "$target")" == "$f" ]]; then
                    log_success "Already linked: $filename"
                    continue
                fi

                ln -snf -- "$f" "$target"
                log_success "Symlinked: $filename -> $target"
            done
        fi
    )
}

echo "==============================================="
echo " AI Custom Commands Setup "
echo "==============================================="

# 1. Gemini CLI Setup
log_info "Setting up Gemini CLI commands..."
link_commands "$REPO_DIR/gemini/commands" "$GEMINI_TARGET_DIR" "toml"

# 2. ClaudeCode Setup
log_info "ClaudeCode Setup"
echo "  ClaudeCode agents are typically installed per-project in '.claude/agents/'."
echo "  To install an agent into a specific project, run the following manually:"
echo ""
echo "    ln -sf $REPO_DIR/claude-code/agents/<AGENT_FILE>.md /path/to/project/.claude/agents/"

# 3. Codex Setup
log_info "Codex Setup"
echo "  Codex files (prompts/scripts) can be referenced directly from:"
echo "    $REPO_DIR/codex/"
echo ""

echo "Setup Complete!"
