#!/bin/bash

function check_xcode {
   # Vérifier si l'utilisateur dispose de Xcode et de ses dépendances
   declare -A xcode_reqs
   xcode_reqs["Xcode"]="0"
   xcode_reqs["Cocoapods"]="0"

   # TODO
   if [ -d "/Applications/Xcode.app" ]; then
      xcode_reqs["Xcode"]="1"
   fi

   if [ -f "/usr/local/bin/pod" ]; then
      xcode_reqs["Cocoapods"]="1"
   fi

   ##
   if [[ "${xcode_reqs["Xcode"]}" -eq 1 && "${xcode_reqs["Cocoapods"]}" -eq 1 ]]; then
      xcode_version=$(xcodebuild -version | grep "Xcode") 
      echo -e "$CHECKED ${BOLD}Xcode${NORMAL} - IDE pour le développement IOS et MacOS ($xcode_version)" 
   elif [[ "${xcode_reqs["Xcode"]}" -eq 1 && "${xcode_reqs["Cocoapods"]}" -eq 0 ]]; then
      echo -e "$WARNING ${BOLD}Xcode${NORMAL} - Cocoapods n'est pas installé"
   elif [[ "${xcode_reqs["Xcode"]}" -eq 0 && "${xcode_reqs["Cocoapods"]}" -eq 1 ]]; then
      echo -e "$WARNING ${BOLD}Xcode${NORMAL} - Xcode n'est pas installé"
   elif [[ "${xcode_reqs["Xcode"]}" -eq 0 && "${xcode_reqs["Cocoapods"]}" -eq 0 ]]; then
      echo -e "$UNCHECKED ${BOLD}Xcode${NORMAL} et ses dépendances ne sont pas installés"
   fi

   if [ "${xcode_reqs["Xcode"]}" -eq 1 ]; then
      xcode_dir=$(xcode-select -p)
      xcode_build=$(xcodebuild -version | grep "Build version")
      echo -e "$CHECKED_RES Xcode est situé dans $xcode_dir $NORMAL"
      echo -e "$CHECKED_RES $xcode_build"
   else
      echo -e "$UNCHECKED Xcode n'est pas installé, pour l'installer : https://apps.apple.com/fr/app/xcode/id497799835?mt=12"
   fi

   if [ "${xcode_reqs["Cocoapods"]}" -eq 1 ]; then
      cocoapods_version=$(pod --version)
      echo -e "$CHECKED_RES Cocoapods - Gestionnaire de dépendances pour IOS ($cocoapods_version)"
   else
      echo -e "$UNCHECKED_RES Cocoapods n'est pas installé, pour l'installer utilisez la commande :$BLUE sudo gem install cocoapods $NC"
   fi
}