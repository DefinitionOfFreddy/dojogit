#!/bin/bash

. $(dirname "$BASH_SOURCE")/00-config.sh

cd $REPO
find . ! -name "$REMOTE_NAME" -delete