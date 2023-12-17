#!/bin/bash

. $(dirname "$BASH_SOURCE")/../00-config.sh



cp -r ${LOCAL} ${LOCAL}_2  > /dev/null 2>&1
cp -r ${REMOTE} ${REMOTE}_backup.git  > /dev/null 2>&1

cd ${LOCAL}_2
git checkout feature/add-file-exercice-2  > /dev/null 2>&1
git fetch  > /dev/null 2>&1
git rebase origin/master  > /dev/null 2>&1

git checkout master  > /dev/null 2>&1
git pull  > /dev/null 2>&1
git merge $NOFF feature/add-file-exercice-2 -m "Merge branch 'feature/add-file-exercice-2'" > /dev/null 2>&1
git push -f  > /dev/null 2>&1
git branch -D feature/add-file-exercice-2 > /dev/null 2>&1

cd ${REMOTE}
git  --no-pager lag --branches

cd ${WORKDIR}
rm -rf ${LOCAL}_2
rm -rf ${REMOTE}

mv ${REMOTE}_backup.git ${REMOTE}


