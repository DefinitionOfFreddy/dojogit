#!/bin/bash

. $(dirname "$BASH_SOURCE")/00-config.sh

cd $WORKDIR

TIMESTAMP="$(date +"%s")"
rm -rf $TIMESTAMP
git clone $REMOTE $TIMESTAMP

cd $TIMESTAMP
git checkout -b feature/$TIMESTAMP


echo hello >> random-$TIMESTAMP.txt
git add random-$TIMESTAMP.txt;

git commit -am "commit file random-${TIMESTAMP}"

git checkout master
git merge --no-ff feature/$TIMESTAMP -m "Merge branche 'feature/$TIMESTAMP'"

git push

cd $WORKDIR
rm -rf $TIMESTAMP