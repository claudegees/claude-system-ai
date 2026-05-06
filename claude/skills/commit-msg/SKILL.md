---
name: commit-msg
description: Conventional Commits 準拠のコミットメッセージを生成。「コミットメッセージ書いて」「commit message」と言われたとき起動。
---

# Commit Message Generator

ステージ済みの変更からConventional Commits形式のメッセージを生成する。

## 手順

1. `git diff --staged` で変更内容を確認
2. 以下のtype を判定:
   - `feat`: 新機能
   - `fix`: バグ修正
   - `docs`: ドキュメントのみ
   - `refactor`: 機能変更なしの内部改善
   - `test`: テスト追加・修正
   - `chore`: ビルド・依存関係
3. 変更の影響範囲（scope）を抽出
4. 1行サマリ（50文字以内）+ 必要なら本文

## 出力形式

```
<type>(<scope>): <subject>

<body の説明（必要な場合のみ）>
```

## 注意

- 過去形ではなく現在形（`add` not `added`）
- 1コミット1目的を原則とする
- 複数の変更が混ざっていれば分割を提案する
