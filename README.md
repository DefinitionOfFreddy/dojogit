# dojogit

Repository contenant des exercices git.
Pour vérifier le bon fonctionnement du projet, lancer le script `HOWTO.sh`.

## Troubleshoot

### Problèmes de droits sur les scripts
Si besoin, pour mettre à jours les droits des scripts : 


```bash
find . -type d -exec chmod 755 {} \ && find . -type f -exec chmod 644 {} \;
```

