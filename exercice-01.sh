#!/bin/bash

. $(dirname "$0")/scripts/00-config.sh

$SCRIPTDIR/exercice-01/solution-01-0.sh > /dev/null 2>&1

cat << EOF
Exercice 1 : Cas nominal.

Le repo distant de base de trouve sous repo/remote.git.

Il a pour l'instant le graphe suivant : 
EOF

cd $REMOTE
git  --no-pager lag --branches



cat << EOF



L'objectif de cet exercice est de réaliser votre première feature en tant que développeur.
La feature demandée est d'ajouter le fichier exo1.txt.
Pour cela, vous devez : 
- cloner le projet remote
- faire votre propre branche feature/votrenomdefeature, à partir de master
- Ecrire le code, le commiter (un seul commit attendu)
- Pousser la branche


A ce moment de l'exercice, le dépot remote doit ressembler à ceci : 

EOF

$SCRIPTDIR/exercice-01/solution-01-1.sh

cd $REMOTE
git  --no-pager lag --branches


cat << EOF



Une fois cette étape atteinte, il faut simuler le merge réalisé sur la remote.
La remote n'étant pas un répertoire de travail (pas de workspace sur un repo bare), le travail de merge sera à effectuer sur un dépôt local.

Quelques références : 
- https://git-scm.com/book/en/v2/Git-on-the-Server-Getting-Git-on-a-Server
- https://git-scm.com/docs/gitglossary#Documentation/gitglossary.txt-aiddefbarerepositoryabarerepository
- https://git-scm.com/book/en/v2/Appendix-C:-Git-Commands-Getting-and-Creating-Projects

Le merge sera considéré complet si : 
- La branche créée a été mergée sur master avec un commit de merge
- La branche master a été mise à jour sur le projet remote.git
- ⚠️ La branche de feature a été supprimée du projet remote.git


EOF


$SCRIPTDIR/exercice-01//solution-01-2.sh

cd $REMOTE
git  --no-pager lag --branches

cat << EOF


Relancer ce script va régénérer le dossier bare à son état de base.
EOF


cd $LOCAL
git reset --hard e1.0.0  > /dev/null 2>&1
git push -f  > /dev/null 2>&1
$SCRIPTDIR/04-clean-local.sh > /dev/null 2>&1
