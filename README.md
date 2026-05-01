# Claude Code フォルダ構成

このディレクトリは、Claude Code を使う際なフォルダ構成
新規プロジェクトに `.claude/` と `CLAUDE.md` をコピーして雛形として使える。

>
> ```bash
> mv claude .claude
> ```

## 全体構成

```
project-root/
├── CLAUDE.md                       # プロジェクト指示書（Claudeが毎回読む）
├── .gitignore                      # settings.local.json などを除外
├── .claude/
│   ├── settings.json               # 共有設定（コミット対象）
│   ├── settings.local.json         # 個人設定（.gitignoreで除外）
│   ├── agents/                     # カスタムサブエージェント
│   │   └── code-reviewer.md
│   ├── skills/                     # カスタムスキル（再利用可能な手順書）
│   │   └── example-skill/
│   │       └── SKILL.md
│   ├── commands/                   # スラッシュコマンド
│   │   └── review.md
│   ├── hooks/                      # フック用シェルスクリプト
│   │   └── block-destructive-cmd.sh
│   └── rules/                      # CLAUDE.mdから参照する詳細ルール
│       └── coding-style.md
├── src/                            # ソースコード
├── tests/                          # テスト
└── docs/                           # ドキュメント
```

## ファイル種別と役割

| ファイル | コミット | 役割 |
|---|---|---|
| `CLAUDE.md` | ✅ | プロジェクト全員が共有する指示書 |
| `.claude/settings.json` | ✅ | チーム共有のフック・パーミッション設定 |
| `.claude/settings.local.json` | ❌ | 個人の上書き設定（API key 等） |
| `.claude/agents/*.md` | ✅ | 役割特化のサブエージェント定義 |
| `.claude/skills/*/SKILL.md` | ✅ | 繰り返し使う手順書 |
| `.claude/commands/*.md` | ✅ | `/コマンド名` で呼び出す再利用可能プロンプト |
| `.claude/hooks/*.sh` | ✅ | ツール呼び出し前後で動くシェルスクリプト |
| `.claude/rules/*.md` | ✅ | CLAUDE.mdから`@rules/...`で参照する詳細ルール |

## 設計のコツ

- **CLAUDE.md は短く保つ** — 詳細は `rules/` に切り出して `@rules/foo.md` で参照
- **commands は短い・頻繁** / **skills は手順が多い・条件分岐あり**
- **agents は context を分離したい時** — レビュー / リサーチ / テスト等
- **hooks は安全装置** — 破壊的コマンド禁止、出力先検証など
