#!/bin/bash

. $(dirname "$BASH_SOURCE")/../00-config.sh

$SCRIPTDIR/01-bare.sh > /dev/null
$SCRIPTDIR/02-setup-commits.sh > /dev/null

git clone ${REMOTE} ${LOCAL} 2>&1
cd ${LOCAL}
git checkout master

echo "Init file" > interesting-file.txt > /dev/null 2>&1
git add interesting-file.txt
git commit -m "feature add interestring-file"
git push



git checkout -b feature/exo3 > /dev/null 2>&1
echo "one line" >> exo3.txt; git add exo3.txt; git commit -m "wip exo3.txt" > /dev/null 2>&1
echo "two lines" >> exo3.txt; git add exo3.txt; git commit -m "wip exo3.txt" > /dev/null 2>&1
echo "three lines" >> exo3.txt; git add exo3.txt; git commit -m "wip exo3.txt" > /dev/null 2>&1

echo "I am on exercice 3" > interesting-file.txt
git add interesting-file.txt
git commit -m "exercice 3 : Update interesting file"

echo "four lines" >> exo3.txt; git add exo3.txt; git commit -m "wip exo3.txt" > /dev/null 2>&1
echo "HOTFIX QUICK" >> draft.txt; git add draft.txt; git commit -m "HOTFIX : it is fixed" > /dev/null 2>&1
git push -u origin feature/exo3 > /dev/null 2>&1

cd $WORKDIR
git clone ${REMOTE} ${LOCAL}_2
cd ${LOCAL}_2
git config user.name "John Doe"
git config user.email "change.me@tsn.com"
git checkout -b feature/other-feature
echo "I am on master" > interesting-file.txt
git add interesting-file.txt
git commit -m "Other teammember : Update interesting file"
git switch master
git merge $NOFF feature/other-feature -m "Merge branch 'feature/other-feature'" > /dev/null
git push

cd $WORKDIR

rm -rf ${LOCAL}_2