#!/bin/bash


. $(dirname "$0")/scripts/00-config.sh

$SCRIPTDIR/exercice-head/00-setup.sh  > /dev/null 2>&1

cat << EOF

Ready to git :)
EOF
