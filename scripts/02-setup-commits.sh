#!/bin/bash

. $(dirname "$BASH_SOURCE")/00-config.sh

git clone $REMOTE $LOCAL
cd $LOCAL

git config user.name "Chuck Norris"
git config user.email "chuck.norris@oujeveux.com"
git config user.email "chuck.norris@oujeveux.com"

# First feature A
git checkout -b feature/add-file-a
echo "fileA" > fileA.txt; git add fileA.txt; git commit -m "adding file A"
git checkout master
git merge $NOFF feature/add-file-a -m "Merge branch 'feature/add-file-a'"
if [ $CLEAN_BRANCHES -eq 1 ]; then
git branch -D feature/add-file-a
fi


# Second feature B
git checkout -b feature/add-file-b-and-c
echo "fileB" > fileB.txt; git add fileB.txt; git commit -m "adding file B (big commit, keep this one)"
echo "fileC" > fileC.txt; git add fileC.txt; git commit -m "adding file C (big commit, keep this one)"
git checkout master
git merge $NOFF feature/add-file-b-and-c -m "Merge not squashed branch 'feature/add-file-b-and-c'"
if [ $CLEAN_BRANCHES -eq 1 ]; then
git branch -D feature/add-file-b-and-c
fi


# Third feature : correct file A
git checkout -b fix/fix-file-a
echo "fix FileA" >> fileA.txt; git commit -am "fixing file A"
git checkout master
git merge $NOFF fix/fix-file-a -m "Merge branch 'fix/fix-file-a'"
if [ $CLEAN_BRANCHES -eq 1 ]; then
git branch -D fix/fix-file-a
fi

git tag -a e1.0.0 -m "Root starting point"
git push
git push origin e1.0.0

cd $WORKDIR; rm -rf $LOCAL