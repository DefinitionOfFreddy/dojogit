#!/bin/bash

. $(dirname "$BASH_SOURCE")/../00-config.sh



cd $REPO
git clone ./remote.git $LOCAL > /dev/null 2>&1
cd $LOCAL > /dev/null 2>&1
git checkout -b feature/add-file-exercice-1 > /dev/null 2>&1
echo "Yes !" >> exo1.txt; git add exo1.txt; git commit -m "adding exo1.txt" > /dev/null 2>&1
git push -u origin feature/add-file-exercice-1 > /dev/null 2>&1