#!/bin/bash

. $(dirname "$0")/scripts/00-config.sh

$SCRIPTDIR/01-bare.sh > /dev/null 2>&1
$SCRIPTDIR/02-setup-commits.sh > /dev/null 2>&1

cat << EOF
Bonjour et bienvenue dans cette suite d'exercices centrée autour de la manipulation de commit git !
Cette suite se veut : 
    - Indépendant d'un exercice à l'autre
    - De difficulté progressive
    - Proche d'une suite d'opérations qu'un développeur peut réaliser lors d'un projet classique.

Pour respecter un workflow classique, nous allons mettre en place pour chaque exercice un dépôt 'remote' qui fera office de dépôt distant.
Cette suite d'exercices va se baser sur un Github Flow (https://docs.github.com/fr/get-started/quickstart/github-flow) :
    - La branche master est la branche par défaut
    - Pour une nouvelle feature, on créé une branche feature/description-feature
        - On fait autant de commit que nécessaire
        - avant de merger, on squash si besoin nos commits (voir exercice ???) pour avoir un minimum de commits indivisibles
        - on merge sur master, en s'assurant que la branche n'ai aucun commit de retard.
            - NB : ici, l'option --no-ff est active, ce qui fait qu'un commit de merge sera toujours présent.
        - on supprime la branche de travail.


Le dépôt distant (repo/remote.git) émule ici le comportement d'un repository distant type github, gitlab, etc. Cependant, pour comprendre la logique derrière les manipulations de commit et de branches, les opérations réalisées habituellements (merge request, squash and merge) seront effectuée à la main, dans le repository de travail.


Le dépôt de base est toujours le même, et chaque exercice se basera sur celui-ci selon le point à travailler. Voici un graphe de ce repo de base, avec quelques features de mergées, qui sera dans chaque exercice sous le dossier repo/remote.git : 

EOF

cd $REMOTE
git  --no-pager lag --branches

cat << EOF



La liste des exercices est la suivante : 

- Exercice 1 :  
    Exercice assez simple pour s'échauffer, on reste sur le cas nominal. On clone le repository, on créé sa branche pour une nouvelle feature, qui ne nécessite qu'un seul commit, on merge sur master, on pousse et on vérifie que l'état attendu est le bon.
- Exercice 2 :
    Exercice autour du rebase nominal, pour ce remettre à jour par rapport à master
- Exercice 3 :
    Exercice basé sur la modification de l'historique local, via amend ou rebase
- Exercice 4 :
    Perdre un commit est si facile à faire ! Introduction au reflog.
- Exercice 5 :
    Cas concret : que c'est il passé ?
    

Avant de commencer un exercice, je vous encourage à regarder l'état de ce repo. Pour cela, je conseille d'ajouter cet alias pour voir l'état du répo facilement : 

✔️   git config alias.lag "log --graph --abbrev-commit --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'"

Cet alias est un git log auquel on ajoute un formatage pour le rendre plus lisible. Il a déjà été configuré côté remote. Enfin, lancer la commande suivante dans un nouveau terminal permet de surveiller l'état de la remote toutes les deux secondes. Pratique pour voir l'impact d'un git push !

✔️   watch --color "cd ${REMOTE} && git -c color.ui=always lag --branches"


Le dossier repo, à la racine de ce projet git, a été ajouté dans le .gitignore. Tout travail effectué dans ce dossier n'aura donc aucun impact sur le répo de base, il est à considérer comme une sandbox !

EOF

$SCRIPTDIR/03-clean-all.sh > /dev/null 2>&1




# cat << EOF

#  🚧        🚧   🚧🚧🚧   🚧🚧🚧🚧
#  🚧   🚧   🚧     🚧     🚧     🚧 
#  🚧   🚧   🚧     🚧     🚧     🚧 
#  🚧   🚧   🚧     🚧     🚧🚧🚧🚧
#  🚧   🚧   🚧     🚧     🚧       
#  🚧   🚧   🚧     🚧     🚧       
#    🚧🚧 🚧🚧    🚧🚧🚧   🚧       
                       
# EOF