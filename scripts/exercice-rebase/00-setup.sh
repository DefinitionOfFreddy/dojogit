#!/bin/bash

. $(dirname "$BASH_SOURCE")/../00-config.sh

$SCRIPTDIR/01-bare.sh > /dev/null  2>&1 
$SCRIPTDIR/02-setup-commits.sh > /dev/null  2>&1


git clone ${REMOTE} ${LOCAL} 2>&1
cd ${LOCAL}
git checkout -b feature/add-file-exercice-2 > /dev/null 2>&1
echo "Yes !" >> exo2.txt; git add exo2.txt; git commit -m "adding exo2.txt" > /dev/null 2>&1
git push -u origin feature/add-file-exercice-2 > /dev/null 2>&1

cd $WORKDIR

git clone ${REMOTE} ${LOCAL}_2 2>&1
cd ${LOCAL}_2
git config user.name "John Doe"
git config user.email "change.me@tsn.com"
git checkout -b feature/other-feature > /dev/null 2>&1
echo "another commit" >> draft.txt; git add draft.txt; git commit -m "adding draft.txt" > /dev/null 2>&1
git switch master
git merge $NOFF feature/other-feature -m "Merge branch 'feature/other-feature'" > /dev/null 2>&1
git push

cd $WORKDIR

rm -rf ${LOCAL}_2