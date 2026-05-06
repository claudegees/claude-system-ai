---
name: dep-check
description: 依存関係の更新影響を調査。Breaking change の有無・セキュリティアラートを確認。「依存更新して」「dependency upgrade」で起動。
---

# Dependency Check

依存パッケージの更新時に、安全性と影響範囲を確認する。

## 手順

1. **現状確認**
   - `package.json` / `requirements.txt` 等の現在のバージョン
   - lockファイルとの差分
   - 既知の脆弱性: `npm audit` / `pip-audit`

2. **更新候補の調査**
   - パッチ更新: 即時対応OK
   - マイナー更新: CHANGELOG 確認
   - **メジャー更新**: Breaking change を必ず確認（migration guide を読む）

3. **影響範囲の特定**
   ```bash
   # コードベースで該当パッケージのimport箇所を grep
   grep -r "from 'package-name'" src/
   ```

4. **更新の実行と検証**
   - 1パッケージずつ更新（複数同時はトラブル切り分け不能）
   - テスト実行
   - 動作確認

## 優先度

| 状況 | 優先度 |
|---|---|
| セキュリティパッチ | 🔴 即時 |
| 主要依存のメジャー更新 | 🟡 計画的 |
| 開発用ツールのマイナー更新 | 🟢 通常 |
| 廃止予定パッケージ | 🟡 代替検討 |

## 守ること

- **`--force` で強制解決しない**: 競合の根本原因を直す
- **`package-lock.json` を必ずコミット**
- **メジャー更新は別 PR**: 切り戻しを容易に
- **lockファイル更新だけのPRも歓迎**: 小さく安全
