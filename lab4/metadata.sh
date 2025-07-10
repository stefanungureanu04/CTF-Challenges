# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

CONTENT=(
    "=== Laborator 4 - Expresii regulate si filtrare ===\n"
    "Tematici principale:"
    "- Comenzi utile: grep, egrep, sed, awk"
    "- Metacaractere si expresii regulate de baza"
    "- Filtrarea continutului fisierelor"
    "- Selectarea si extragerea liniilor si coloanelor"
)

EASY=(
    "Gaseste un fisier cu nume specific"
    "Numarul total de fisiere in directorul home"
    "Gaseste fisiere ascunse"
)

MEDIUM=(
    "Gaseste fisiere mai mici de 1KB modificate in ultimele 24h"
    "Numarul de procese ale utilizatorului curent"
    "Afiseaza permisiunile tuturor fisierelor din /tmp"
)

HARD=(
    "Gaseste un fisier cu dimensiune exacta si UID specific"
    "Analiza unui fisier de log pentru pattern specific"
    "Cauta fisiere cu setuid si afiseaza proprietarul"
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

# function for displaying exercises options
show_ctf_options() {
    echo -e "${GREEN}Alege un exercitiu:${NC}\n"

    echo "EASY:"
    for i in "${!EASY[@]}"; do
      echo "  $((i+1)). ${EASY[$i]}"
    done
    echo

    echo "MEDIUM:"
    for i in "${!MEDIUM[@]}"; do
      echo "  $((i+1+${#EASY[@]})). ${MEDIUM[$i]}"
    done
    echo

    echo "HARD:"
    for i in "${!HARD[@]}"; do
      echo "  $((i+1+${#EASY[@]}+${#MEDIUM[@]})). ${HARD[$i]}"
    done
    echo

    echo "0. Inapoi la meniul principal"
    echo
}