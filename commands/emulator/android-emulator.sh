#!/bin/bash

source "$(dirname "$0")/../functions/select_option.sh"

# Recupere la liste des avds
avds=$(emulator -list-avds)

# Verifie si il y a des avds
if [ -z "$avds" ]; then
    echo "Aucun emulateur android n'a ete trouve"
    exit 1
fi

# Recupère l'index de l'avd selectionne
echo "Emulateurs Android disponibles :"
select_option $avds
selected=$?

# Recupère le nom de l'avd selectionne
avd=$(echo "$avds" | sed "${selected}q;d")

# Demande si l'utilisateur veut lancer l'avd
echo -e "Voulez-vous lancer l'emulateur ${BLUE}$avd${NC} ? (y/n)"

read -p "" answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    # Lance l'avd
    emulator -avd "$avd" </dev/null &>/dev/null &
    echo "Lancement de l'emulateur ${BLUE}$avd${NC} en cours..."
else
    echo "Lancement de l'emulateur annule"
fi





