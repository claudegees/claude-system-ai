# 新規参加者向けオンボーディング

このドキュメントは、新しくプロジェクトに参加する人が初日〜1週目で読むもの。

## Day 1: 環境構築

### 必要なアカウント

- [ ] GitHubアカウント（社内 organization に招待される）
- [ ] AWS / GCP コンソールアクセス（必要に応じて）
- [ ] Slack ワークスペース
- [ ] エラー監視ツール（Sentry等）

### ローカル開発環境

1. リポジトリを clone
   ```bash
   git clone <repo-url>
   cd <repo-name>
   ```

2. 必要ツールのインストール
   - Node.js 20.x LTS（[`.nvmrc`](.nvmrc) 参照）
   - Docker Desktop
   - pnpm

3. 環境変数を設定
   ```bash
   cp .env.example .env.local
   # .env.local を編集（チームメンバーから値をもらう）
   ```

4. 依存インストールと起動
   ```bash
   pnpm install
   docker compose up -d
   pnpm dev
   ```

5. http://localhost:3000 で動作確認

### 困ったら

- `#dev-help` チャンネルで質問
- ペアプロを希望する場合は遠慮なく言う
- ドキュメントが古ければ修正PRを出す（最高の貢献）

## Day 2-3: コードベースを読む

以下を順に読むのが推奨:

1. [README.md](../README.md) — プロジェクト全体像
2. [context/architecture.md](architecture.md) — アーキテクチャ
3. [context/domain-glossary.md](domain-glossary.md) — 用語
4. [context/decisions.md](decisions.md) — なぜこうなっているか
5. [context/tech-stack.md](tech-stack.md) — 採用技術

その後、実コード:

1. ルーティングのエントリポイント
2. 主要なドメインモデル
3. 代表的なユースケース1つを最初から最後まで追う

## Week 1: 最初のPRを出す

### 推奨タスク

「good first issue」ラベルが付いた issue を選んで対応。
- 軽微なバグ修正
- ドキュメントの誤字訂正
- テストの追加

### PRを出すときのチェック

- [ ] テストが通る
- [ ] リンタが通る
- [ ] PR description にスクショ or 動作説明
- [ ] 関連 issue へのリンク
- [ ] レビュアー指定

## チーム文化

### コミュニケーション

- **同期**: Slack 通話、ペアプロ、デイリースタンドアップ
- **非同期**: Slack スレッド、PR コメント、ドキュメント
- 日中は反応速度よりも集中時間を優先する文化

### コードレビュー

- 1営業日以内にコメントを返す
- LGTM だけでなく、必ず1つは質問 or 改善提案
- 厳しさより建設性を重視
- 自分のPRが指摘されてもそれは攻撃ではない

### 質問のしかた

- 30分悩んだら聞く（自分で抱え込まない）
- 何を試したかを添える
- 結論だけでなく経緯も共有する

## やらないでほしいこと

- 黙って大きなリファクタを始める（事前に相談）
- main ブランチへの直接push（必ずPR経由）
- レビュー無しのマージ
- テスト無しの新規機能
- `console.log` のコミット（自動チェックでブロックされるが念のため）
