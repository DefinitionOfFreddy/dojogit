#!/bin/bash


. $(dirname "$0")/scripts/00-config.sh


$SCRIPTDIR/exercice-rebase/00-setup.sh > /dev/null 2>&1 

cat << EOF



L'exercice consiste à recréer cet arbre de commit : 
                       


EOF

$SCRIPTDIR/exercice-rebase/00-solution.sh


cat << EOF






Le dossier local est déjà prêt. il ressemble actuellement à ceci : 
                       
EOF


cd ${REMOTE}
git  --no-pager lag --branches



