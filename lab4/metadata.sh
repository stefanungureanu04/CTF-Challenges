# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# lab content
CONTENT=(
    "=== Laborator 4 - Expresii regulate si filtrare ===\n"
    "Tematici principale:"
    "- Comenzi utile: grep, egrep, sed, awk"
    "- Metacaractere si expresii regulate de baza"
    "- Filtrarea continutului fisierelor"
    "- Selectarea si extragerea liniilor si coloanelor"
)

# exercise
CHALLENGE=(
    "=== CTF: Expresii regulate ===\n"
    "In directorul Desktop/CHALLENGE se gaseste un director BankATM."
    "Acesta contine un fisier ce prezinta structura organizatorica si un fisier"
    "care stocheaza datele de contact ale angajatilor."
    "De asemenea, in subdirectorul departamente se gasesc fisierele dept00X.txt"
    "cu inventarul functiilor din cadrul departamentului respectiv."
    "Descoperiti, cu ajutorul expresiilor regulate"
    "prezentate in laborator, numarul de telefon al persoanei"
    "ce indeplineste functia de Coordonator IT."
    ""
    "Scrieti rezultatul in fisierul ~/Desktop/CHALLENGE/phonenumber.txt"
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