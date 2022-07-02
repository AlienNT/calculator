#!/usr/bin/env sh

# остановить публикацию при ошибках

# сборка
git checkout master

echo "--------------------------------------------"
git merge dev

echo "--------------------------------------------"
git status

echo "--------------------------------------------"
npm run build

echo "--------------------------------------------"
git add -A

$ echo "--------------------------------------------"
git commit -m "new build $(date '+%d-%m-%y %H:%M:%S')"

echo "--------------------------------------------"
git push origin master

echo "--------------------------------------------"
git subtree push --prefix dist origin prod

echo "--------------------------------------------"
git checkout dev

$SHELL


