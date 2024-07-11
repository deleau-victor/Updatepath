#!/bin/bash

# Récupérer le système d'exploitation de l'utilisateur, il faut savoir si l'utilisateur utilise un mac, un linux ou un windows
# Pour cela on va utiliser la variable d'environnement $OSTYPE
# Pour plus d'informations sur les variables d'environnement : https://fr.wikipedia.org/wiki/Variable_d%27environnement

# On va utiliser la commande uname pour récupérer le nom du système d'exploitation
# Pour plus d'informations sur la commande uname : https://fr.wikipedia.org/wiki/Uname
os=$(uname)

# On va maintenant vérifier si l'utilisateur utilise un mac, un linux ou un windows
# Pour cela on va utiliser la commande case
# Pour plus d'informations sur la commande case : https://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_03.html
case $os in
    Darwin)
        # L'utilisateur utilise un mac
        # On va donc utiliser la commande open pour ouvrir le fichier
        # Pour plus d'informations sur la commande open : https://ss64.com/osx/open.html
        echo "Vous utilisez un mac"
        ;;
    Linux)
        # L'utilisateur utilise un linux
        # On va donc utiliser la commande xdg-open pour ouvrir le fichier
        # Pour plus d'informations sur la commande xdg-open : https://www.freedesktop.org/wiki/Software/xdg-utils/
        echo "Vous utilisez un linux"
        ;;
    *)
        # L'utilisateur utilise un windows
        # On va donc utiliser la commande start pour ouvrir le fichier
        # Pour plus d'informations sur la commande start : https://ss64.com/nt/start.html
        echo "Vous utilisez un windows"
        ;;
esac