#!/bin/bash


. $(dirname "$0")/scripts/00-config.sh   > /dev/null

$SCRIPTDIR/exercice-head/00-setup.sh

cat << EOF

Exercice utilisé pour discuter de la HEAD : 
- Se promener sur un commit (detached HEAD)
- Retravailler le rebase interactif / le squash
- Suivre les déplacement de la HEAD


Ready to git :)
EOF
