# コード・運用規約

## ブランチ運用

- `main`: 常にデプロイ可能な状態
- `feat/<topic>`: 新機能
- `fix/<topic>`: バグ修正
- `chore/<topic>`: ビルド・依存・雑務
- `docs/<topic>`: ドキュメント更新

すべての変更は PR 経由で main へマージ。直接 push は禁止（branch protection で強制）。

## コミットメッセージ

[Conventional Commits](https://www.conventionalcommits.org/) に従う:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### type

| type | 用途 |
|---|---|
| `feat` | 新機能 |
| `fix` | バグ修正 |
| `docs` | ドキュメントのみ |
| `refactor` | 機能変更なしの内部改善 |
| `test` | テスト追加・修正 |
| `chore` | ビルド・依存関係 |
| `perf` | パフォーマンス改善 |

### 例

```
feat(auth): add OAuth login flow

Google と GitHub OAuth に対応。リダイレクトURLは環境変数で切り替え。

Closes #123
```

## PR の規約

### タイトル

Conventional Commits と同じ形式。 squashマージ時にコミットメッセージになる。

### Description テンプレート

```markdown
## Why
このPRが必要な理由（背景・課題）

## What
変更内容のサマリ

## How to test
動作確認手順
- [ ] テストケース1
- [ ] テストケース2

## Screenshots (UIの場合)
Before / After

## 関連
Closes #issue-number
```

### サイズ

- 推奨: 400行以下の差分
- 大きい場合は分割を検討
- 1機能 = 1PR を基本とする

### マージ戦略

- **Squash and merge**: 通常はこれ
- Merge commit / Rebase は特別な理由がある場合のみ

## 命名規則

### TypeScript

- 関数・変数: `camelCase`
- クラス・型・interface: `PascalCase`
- 定数: `SCREAMING_SNAKE_CASE`
- ファイル: `kebab-case.ts`
- React コンポーネント: ファイル名も `PascalCase.tsx`

### データベース

- テーブル: `snake_case`、複数形（`users`, `transactions`）
- カラム: `snake_case`
- インデックス: `idx_<table>_<columns>`
- 外部キー: `fk_<table>_<ref_table>`

### API endpoint

- リソースは複数形: `/users`, `/items`
- 階層は深くしない（最大2階層まで）
- HTTP メソッドで動作を表現（カスタム動詞は使わない）

```
GET    /items          # 一覧
POST   /items          # 作成
GET    /items/:id      # 取得
PATCH  /items/:id      # 部分更新
DELETE /items/:id      # 削除
```

## コメント

- **基本書かない**: コードと命名で意図を表現
- **書くべきとき**: なぜそうしたかを残す必要がある場合
  - 仕様の制約
  - パフォーマンス回避策
  - 既知のバグへの対処
  - 一見おかしく見える実装の正当化
- **書いてはいけない**: コードを翻訳しただけのコメント

```ts
// ❌ 悪い例（コードの翻訳）
// i に 1 を加える
i++;

// ✅ 良い例（なぜ）
// API のレート制限回避のため、リクエスト前に最低 100ms の間隔を空ける
await sleep(100);
```

## ログ

- **ロガー**: pino を使う（console.log 禁止）
- **レベル**:
  - `fatal`: プロセス停止級
  - `error`: 予期しないエラー、調査必要
  - `warn`: 異常だがリカバリ可能
  - `info`: 主要なビジネスイベント
  - `debug`: 開発時のみ
- **構造化ログ**: 自由テキストではなくフィールド付き

```ts
// ❌
log.info(`User ${userId} purchased item ${itemId}`);

// ✅
log.info({ userId, itemId, action: "purchase" }, "User purchased item");
```

## エラーハンドリング

- 境界（API endpoint・外部API呼び出し）で try/catch
- 内部関数では例外を握りつぶさない
- ユーザー向けメッセージと内部ログを分離
- エラーは型で表現（`Result<T, E>` パターン推奨）

## 秘密情報の扱い

- **絶対にコミットしない**: API key, password, token, certificate
- 環境変数経由で読み込む
- `.env.example` にキー名のみ記載（値は空）
- pre-commit hook で `secret` パターンを検出（gitleaks 導入済み）
