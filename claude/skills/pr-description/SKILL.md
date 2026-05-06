---
name: pr-description
description: PR の Description を Why/What/How to test 構造で生成。「PR description 書いて」と言われたとき起動。
---

# PR Description Writer

現在のブランチの差分から、レビュアーが理解しやすいPR descriptionを生成する。

## 手順

1. `git log main..HEAD` で本ブランチのコミットを取得
2. `git diff main..HEAD --stat` で変更ファイルの規模を把握
3. 主要な変更を 3つ以下のトピックに集約
4. 以下のテンプレートで生成

## テンプレート

```markdown
## Why
このPRが必要な理由（背景・課題）を1〜3行で

## What
- 変更内容のサマリを箇条書きで
- 1項目1〜2行

## How to test
- [ ] テストケース1
- [ ] テストケース2

## 関連
Closes #issue-number（あれば）
```

## 注意

- 何を変えたかではなく**なぜ**を強調
- スクリーンショットが必要なUI変更は「Screenshots」セクションを追加
- Breaking change がある場合は冒頭に明記
