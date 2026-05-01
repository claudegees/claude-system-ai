#!/usr/bin/env bash
# PreToolUse hook for Bash tool
# 破壊的コマンドをブロックする

set -euo pipefail

# stdin から JSON を受け取り、コマンドを抽出
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

# 危険なパターン
DANGEROUS_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "rm -rf \*"
  "git push --force"
  "git push -f "
  "git reset --hard"
  "git clean -fd"
  "curl.*\| *bash"
  "curl.*\| *sh"
  "wget.*\| *bash"
  "chmod -R 777"
  "dd if="
  "mkfs"
  ":(){ :|:& };:"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qE "$pattern"; then
    echo "ERROR: 危険なコマンドが検出されました: $pattern" >&2
    echo "コマンド: $COMMAND" >&2
    echo "実行をブロックしました。本当に必要であればユーザーに確認してください。" >&2
    exit 2  # exit 2 = ブロック（Claude にエラーを返す）
  fi
done

exit 0
