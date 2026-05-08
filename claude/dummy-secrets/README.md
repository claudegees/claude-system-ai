# dummy-secrets

テスト用のダミーシークレットファイル群。

**全ての値は架空のものです。実際の認証情報は含まれていません。**

AWS のキー値は AWS 公式ドキュメントで使われている `EXAMPLE` 値（`AKIAIOSFODNN7EXAMPLE` / `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`）を採用しています。

## ファイル

- `.env` — 環境変数形式
- `credentials` — AWS CLI 形式（`~/.aws/credentials` 想定）
- `config.json` — JSON 形式

## 用途想定

- シークレットスキャナー（gitleaks, trufflehog 等）の動作テスト
- 漏洩検知 Hook の動作確認
- 教育・デモ用途
