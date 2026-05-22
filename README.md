# 仲良くなる冒険 — 100 Questions RPG

ドット絵RPG風の100問質問ゲーム。デート・初対面で2人で遊ぶ用。

## デプロイ手順 (GitHub Pages)

1. GitHubで新しいリポジトリを作成（例: `100-questions-rpg`）
2. このフォルダの中身を全部アップロード
3. Settings → Pages → Source を `main` ブランチに設定
4. 数十秒待つと `https://<username>.github.io/<repo-name>/` で公開される

## ファイル

- `index.html` — スタンドアロン版。1ファイルで完結、オフラインでも動く

## 仕様

- 全100問、5つの世界 (草原 → 街 → 森 → 塔 → 洞窟) を旅する
- スキップ15回でGAME OVER、ただし1回だけ「究極の問い」で復活可能
- 8bitBGM・SE付き
- 難易度切替 (ライト40問 / ノーマル100問 / ディープ60問)
