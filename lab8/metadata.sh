# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# lab content
CONTENT=(
    "=== Laborator 8 - Permisiuni si securitate ===\n"
    "Tematici principale:"
    "- Permisiuni pe fisiere si directoare: rwx"
    "- Comenzi: chmod, chown, chgrp"
    "- Setuid, setgid si sticky bit"
    "- UMask si mostenirea permisiunilor"
)

# exercise
CHALLENGE=(
    "=== CTF: Sistemul de permisiuni ===\n"
    "In directorul ~/Desktop/CHALLENGE/workspace se afla mai multe fisiere fara permisiuni."
    ""
    "Configureaza sistemul conform cerintelor urmatoare:"
    " - Seteaza sticky bit pe directorul workspace"
    " - Fisierul execute_me.sh trebuie sa poata fi citit si executat de toti," 
    "   dar doar utilizatorul sau sa il poata modifica. De asemenea, trebuie "
    "   sa se execute cu privilegiile proprietarului."
    " - Fisierul secret.txt trebuie sa permita utilizatorului curent toate "
    "   drepturile (read, write, execute), folosind ACL."
    " - Fisierul backup.log trebuie sa fie accesibil doar pentru citire de catre "
    "   utilizatorul sau, nimeni altcineva neavand acces."
    ""
    "Validati exercitiul prin rularea scriptului ./check.sh aflat in directorul workspace."
)

# function for displaying content
show_lab_content() {
  clear
  if [ "${#CONTENT[@]}" -gt 0 ]; then
    echo -e "${CYAN}${CONTENT[0]}${NC}"
    for ((i = 1; i < ${#CONTENT[@]}; i++)); do
      echo -e "${YELLOW}${CONTENT[$i]}${NC}"
    done
    echo
  fi
}

# function for displaying the exercise
show_ctf() {
  if [ "${#CHALLENGE[@]}" -gt 0 ]; then
    echo -e "${GREEN}${CHALLENGE[0]}${NC}"
    for ((i = 1; i < ${#CHALLENGE[@]}; i++)); do
      echo "${CHALLENGE[$i]}"
    done
    echo
  fi
}
