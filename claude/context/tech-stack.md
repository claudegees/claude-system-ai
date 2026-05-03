# 技術スタック

## フロントエンド

| カテゴリ | 採用技術 | バージョン目安 |
|---|---|---|
| 言語 | TypeScript | 5.x |
| フレームワーク | React | 18.x |
| ルーティング | React Router | 6.x |
| 状態管理 | Zustand | 最新 |
| データ取得 | TanStack Query | 5.x |
| スタイリング | Tailwind CSS | 3.x |
| ビルド | Vite | 5.x |
| テスト | Vitest, React Testing Library | 最新 |

## バックエンド

| カテゴリ | 採用技術 |
|---|---|
| 言語 | TypeScript (Node.js 20.x LTS) |
| フレームワーク | Fastify |
| ORM | Prisma |
| バリデーション | Zod |
| 認証 | jose (JWT) |
| ロガー | pino |
| テスト | jest, supertest |

## データベース・ストレージ

| カテゴリ | 技術 | 用途 |
|---|---|---|
| Primary DB | PostgreSQL 16 | 一次データソース |
| キャッシュ | Redis 7 | セッション・短期キャッシュ |
| 検索エンジン | Elasticsearch 8 | 全文検索・ファセット |
| オブジェクトストレージ | S3互換 | 画像・添付ファイル |

## インフラ

| カテゴリ | 技術 |
|---|---|
| コンテナ | Docker |
| オーケストレーション | Kubernetes |
| CI/CD | GitHub Actions |
| 監視 | Prometheus + Grafana |
| ログ集約 | Loki |
| トレーシング | OpenTelemetry + Jaeger |
| エラー追跡 | Sentry |

## 開発環境

| ツール | 用途 |
|---|---|
| pnpm | パッケージマネージャ |
| Biome | リンタ + フォーマッタ |
| Husky | git hook 管理 |
| commitlint | コミットメッセージ規約 |
| Renovate | 依存関係の自動更新 |

## ローカル開発の起動

```bash
# 依存インストール
pnpm install

# DBコンテナ起動
docker compose up -d

# DB マイグレーション
pnpm db:migrate

# 開発サーバ起動
pnpm dev
```

## バージョン更新ポリシー

- **メジャーバージョン更新**: ADR を書いてから実施
- **マイナー/パッチ**: Renovate で自動 PR、レビュー後マージ
- **セキュリティパッチ**: 即時対応（自動マージ可）
