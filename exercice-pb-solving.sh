#!/bin/bash


. $(dirname "$0")/scripts/00-config.sh

$SCRIPTDIR/exercice-problem-solving/00-setup.sh  > /dev/null 2>&1


cat << EOF

Quel est le problème ? Comment le résoudre ?
EOF
