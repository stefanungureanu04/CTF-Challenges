# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# lab content
CONTENT=(
    "=== Laborator 7 - Utilizatori si grupuri ===\n"
    "Tematici principale:"
    "- Crearea si stergerea utilizatorilor si grupurilor"
    "- Fisierele /etc/passwd, /etc/shadow, /etc/group"
    "- Schimbarea utilizatorului activ: su, sudo"
    "- Grupuri primare si secundare"
)

# exercise
CHALLENGE=(
    "=== CTF: Managementul utilizatorilor ===\n"
    "Creeaza un utilizator numit ion_popescu, care sa respecte urmatoarele conditii:"
    "- UID-ul sau trebuie sa fie 2025"
    "- Sa fie membru in grupul family (care are GID 2025)"
    "- Sa aiba ca shell implicit /bin/bash"
    "- Directorul sau home trebuie sa fie: /home/acasa/ion_popescu"
    "- Directorul home trebuie sa aiba permisiuni 755 si sa ii apartina complet (user: ion_popescu, grup: family)"
    ""
    "Checkerul valideaza in timp real starea sistemului."
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