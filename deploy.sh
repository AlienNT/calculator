#!/usr/bin/env sh

# остановить публикацию при ошибках

# сборка
git checkout master
git merge dev
git status
#npm run build
#
#git add -A
#git commit -m "new build $(date '+%d-%m-%y %H:%M:%S')"
#
#git push origin master
#git subtree push --prefix dist origin prod
#
#git checkout dev

$SHELL


