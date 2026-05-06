---
name: api-design
description: REST API endpoint の設計。リソース命名・HTTPメソッド・status code・エラーレスポンスを提案。「API設計して」と言われたとき起動。
---

# API Design

新しいREST API endpointを設計する。

## 設計原則

- **リソース指向**: URLは名詞（複数形）。動詞は HTTP メソッドで表現
- **階層は浅く**: 最大2階層。`/users/:id/posts/:id/comments` は深すぎ
- **冪等性**: GET / PUT / DELETE は冪等、POST は非冪等
- **正しいstatus code**: 200/201/204/400/401/403/404/409/422/500 を使い分け

## 標準パターン

```
GET    /items          → 200 一覧（ページネーション）
POST   /items          → 201 作成（Location header）
GET    /items/:id      → 200 取得 / 404 なし
PATCH  /items/:id      → 200 部分更新 / 404 なし
DELETE /items/:id      → 204 削除 / 404 なし
```

## エラーレスポンス形式

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "User-facing message",
    "details": [
      { "field": "email", "issue": "invalid format" }
    ]
  }
}
```

## 設計時に確認すること

- [ ] リソース名は適切か（複数形・名詞）
- [ ] 認証/認可は必要か（誰がアクセス可能か）
- [ ] レート制限は必要か
- [ ] ページネーション戦略（cursor / offset）
- [ ] 検索・フィルタのクエリパラメータ設計
- [ ] バージョニング戦略（`/v1/...`）
- [ ] レスポンスの型定義（OpenAPI/JSON Schema）
