#!/usr/bin/env sh

# остановить публикацию при ошибках
set -e

# сборка
git checkout master
git merge dev

npm run build

git init
git add -A
git commit -m "new build $(date '+%d-%m-%y %H:%M:%S')"

git push origin master
git subtree push --prefix dist origin prod
git subtree pull --prefix dist origin prod

git checkout dev


