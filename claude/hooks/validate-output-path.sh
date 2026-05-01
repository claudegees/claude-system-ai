#!/usr/bin/env bash
# PostToolUse hook for Write|Edit
# 出力先ディレクトリが想定外でないかを検証する

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""')

# 書き込みを禁止するパス（例: システム領域・他人のホーム等）
FORBIDDEN_PATHS=(
  "/etc/"
  "/usr/"
  "/System/"
  "/private/etc/"
)

for path in "${FORBIDDEN_PATHS[@]}"; do
  if [[ "$FILE_PATH" == "$path"* ]]; then
    echo "WARNING: 想定外のパスへの書き込みです: $FILE_PATH" >&2
    echo "意図した書き込みか、ユーザーに確認してください。" >&2
    # 警告のみ。ブロックはしない（exit 0）
    exit 0
  fi
done

exit 0
