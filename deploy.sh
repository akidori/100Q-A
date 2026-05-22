#!/usr/bin/env bash
# Deploy 100-Questions-RPG to GitHub Pages via gh CLI
# Usage: bash deploy.sh [repo-name]
# Requires: gh (GitHub CLI) — install: brew install gh && gh auth login

set -e

REPO_NAME="${1:-100-questions-rpg}"

echo "▶ リポジトリ名: $REPO_NAME"
echo "▶ ghログイン確認中..."
gh auth status >/dev/null 2>&1 || { echo "✗ gh未ログイン。 'gh auth login' を実行してね"; exit 1; }

# Initialize git repo if not already
if [ ! -d .git ]; then
  git init -b main
  git add .
  git commit -m "Initial commit: 100 Questions RPG"
fi

# Create the GitHub repo and push (will fail if it already exists — that's fine,
# script then just tries to push to it)
gh repo create "$REPO_NAME" --public --source=. --remote=origin --push 2>/dev/null || {
  echo "▶ リポジトリは既に存在。pushだけ実行..."
  git push -u origin main
}

# Enable Pages on main branch / root
USER=$(gh api user --jq .login)
echo "▶ GitHub Pages 有効化..."
gh api -X POST "/repos/$USER/$REPO_NAME/pages" \
  -f "source[branch]=main" \
  -f "source[path]=/" 2>/dev/null || echo "  (Pages既に有効 or APIエラー — 手動でSettings→Pagesから確認してね)"

echo ""
echo "✓ 完了！数十秒〜数分後に以下のURLで公開されるよ:"
echo "  https://$USER.github.io/$REPO_NAME/"
echo ""
echo "ステータス確認: gh api /repos/$USER/$REPO_NAME/pages --jq .status"
