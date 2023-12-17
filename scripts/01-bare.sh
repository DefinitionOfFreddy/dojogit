#!/bin/bash

. $(dirname "$BASH_SOURCE")/00-config.sh


rm -rf $REMOTE
rm -rf $LOCAL

git init --bare $REMOTE
cd $REMOTE
git config alias.lag "log --graph --abbrev-commit --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'"
cd $WORKDIR



git clone $REMOTE $LOCAL

cd $LOCAL

git config user.name "Chuck Norris"
git config user.email "chuck.norris@oujeveux.com"
git config user.email "chuck.norris@oujeveux.com"
git config alias.lag "log --graph --abbrev-commit --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'"

touch README.md; git add README.md; git commit -am "initial commit"
git push

cd $WORKDIR
rm -rf $LOCAL