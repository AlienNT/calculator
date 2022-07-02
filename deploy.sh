#!/bin/bash

# остановить публикацию при ошибках

# сборка
git merge dev
git status
git add -A
git commit -m "merge dev $(date '+%d-%m-%y %H:%M:%S')"
git push origin master


npm run build
git add -A

git commit -m "new build $(date '+%d-%m-%y %H:%M:%S')"
git push origin master

#git subtree push --prefix dist origin prod
#git checkout dev

$SHELL


