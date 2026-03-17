# AI Custom Commands & Agents Repository

AIツール（Gemini CLI、Claude Code、OpenAI Codexなど）用のカスタムコマンド、エージェント、スキルを管理するためのリポジトリです。

## 📁 Directory Structure

詳細な構成は以下の通りです：

- `gemini/commands/`: Gemini CLI用のカスタムコマンド（`.toml`形式）を格納します。
- `claude-code/agents/`: Claude Code用のエージェント定義やプロンプトを保存します。
- `codex/`: OpenAI Codex用のプロンプト（`prompts/`）やスクリプト（`scripts/`）を保持します。

## 🚀 Installation & Setup
付属の `setup.sh` スクリプトを使用することで、グローバル設定を自動的にセットアップします。

```bash
./setup.sh
```

このスクリプトは `gemini/commands/*.toml` を `~/.gemini/commands/` にシンボリックリンクします。

### 🤖 Claude Code Agents

Claude Code のエージェントは通常プロジェクトごとに使用します。プロジェクトでエージェントを使用するには、このリポジトリから対象プロジェクトの `.claude/agents/` ディレクトリへシンボリックリンクを作成してください：

```bash
ln -sf /path/to/this/repo/claude-code/agents/my-agent.md /path/to/target-project/.claude/agents/
```

### 🧠 Codex

Codex用のファイルは必要に応じて各プロジェクトから直接参照して使用してください。
