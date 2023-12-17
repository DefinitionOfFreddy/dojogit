#!/bin/bash



NOFF=""
#NOFF="--no-ff"

#CLEAN_BRANCHES=1
CLEAN_BRANCHES=0



cd $(dirname "$BASH_SOURCE")
SCRIPTDIR=$(pwd)
WORKDIR=$(dirname $(pwd))
REPO="${WORKDIR}/repo"
REMOTE_NAME=remote.git
REMOTE="${WORKDIR}/repo/$REMOTE_NAME"
LOCAL="${WORKDIR}/repo/local"