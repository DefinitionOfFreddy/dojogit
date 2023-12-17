#!/bin/bash

. $(dirname "$BASH_SOURCE")/../00-config.sh

$SCRIPTDIR/01-bare.sh


git clone ${REMOTE} ${LOCAL} 2>&1
cd ${LOCAL}
git config user.name "bob"
git config user.email "bob@bricoleur.com"

echo "Init file" > file1.txt; git add file1.txt; git commit -m "C1 - add file1.txt"
git push

git switch -C feature/bob
echo "Init file" > file2.txt; git add file2.txt; git commit -m "C2 - add file2.txt"
git push --set-upstream origin feature/bob


rm -rf ${LOCAL}_2
git clone ${REMOTE} ${LOCAL}_2 2>&1
cd ${LOCAL}_2
git config user.name "alice"
git config user.email "alice@merveille.com"
echo "Random feature 3" > file3.txt; git add file3.txt; git commit -m "C3 - add file3.txt"
git push


cd ${LOCAL}
rm -rf ${LOCAL}_2

git switch master
git fetch; git merge
git switch feature/bob

git rebase master
git pull

echo "Random commit" >> file3.txt; git add file3.txt; git commit -m "C4 - edit file3.txt"
git push



