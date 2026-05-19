#!/bin/bash
# Double-click this file in Finder to push the site to GitHub.
# (Or run it from Terminal: bash push-to-github.command)

set -e
cd "$(dirname "$0")"

echo "==> Initializing git repo in $(pwd)"
if [ ! -d .git ]; then
  git init -b main
else
  echo "  .git already exists, skipping init"
fi

echo "==> Configuring user"
git config user.email "kyrongreen@gmail.com"
git config user.name "Kyron Green"

echo "==> Staging files"
git add -A

echo "==> Committing"
if git diff --cached --quiet; then
  echo "  Nothing new to commit"
else
  git commit -m "Update One Kreative EDDM landing page"
fi

echo "==> Setting remote"
if git remote | grep -q '^origin$'; then
  git remote set-url origin https://github.com/kyrongreen/onekreative-site.git
else
  git remote add origin https://github.com/kyrongreen/onekreative-site.git
fi

echo "==> Pushing to GitHub"
git push -u origin main

echo ""
echo "Done. View the repo: https://github.com/kyrongreen/onekreative-site"
