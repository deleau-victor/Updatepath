#!/bin/bash

# Demande le chemin vers l'executable a ajouter aux paths
echo "Entrez le chemin vers l'executable que vous souhaitez ajoutez a vos paths :"
read -p "" new_path

# verifie si le chemin existe
if [ -d "$new_path" ]; then
    # verifie si le chemin est deja dans les paths
    if [[ ":$PATH:" == *":$new_path:"* ]]; then
        echo "Le chemin existe deja dans vos paths"
        exit 1
    else
        # ajoute le chemin aux paths
        echo -e "$HOME/$new_path" | sudo tee -a /etc/paths > /dev/null
        echo "Le chemin a ete ajoute a vos paths"
        echo "Veuillez maintenant redemarrer votre terminal pour que les changements prennent effet"
    fi
else
    echo "Le chemin spécifié n'existe pas"
    exit 1
fi
