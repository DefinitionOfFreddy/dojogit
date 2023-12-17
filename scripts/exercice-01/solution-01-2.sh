#!/bin/bash

. $(dirname "$BASH_SOURCE")/../00-config.sh

cd $LOCAL

git checkout master > /dev/null 2>&1
git merge $NOFF feature/add-file-exercice-1 -m "Merge branch 'feature/add-file-exercice-1'" > /dev/null 2>&1
git push > /dev/null 2>&1
git push origin --delete feature/add-file-exercice-1 > /dev/null 2>&1
git branch -D feature/add-file-exercice-1 > /dev/null 2>&1
