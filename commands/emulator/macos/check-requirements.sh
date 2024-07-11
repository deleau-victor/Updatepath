#!/bin/zsh

source "$(dirname "$0")/../../../constants/color.sh"
source "$(dirname "$0")/../../../constants/symbol.sh"
source "$(dirname "$0")/../../../constants/font.sh"
source "$(dirname "$0")/check-xcode.sh"

# Vérifier si l'utilisateur dispose des prérequis pour lancer un émulateur iOS, en sachant que l'utilisateur utilise un mac

CHECKED_RES="${ESCAPE}${GREEN}$POINT${NC}${BOLD}"
UNCHECKED_RES="${ESCAPE}${RED}$POINT${NC}${BOLD}"

echo "${BOLD}Vérification des prérequis pour le développement mobile :${NORMAL}"
echo ""

check_xcode