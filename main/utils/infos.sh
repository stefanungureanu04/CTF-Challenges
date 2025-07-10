#!/bin/bash

# colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

INTRO=(
  "=== Platforma CTF - Sisteme de Operare ===\n"
  "Aceasta aplicatie permite testarea cunostintelor prin mini-challenge-uri CTF."
  "Fiecare laborator include exercitii structurate pe trei nivele de dificultate:"
  "- EASY, MEDIUM, HARD"
  "Progresul este salvat automat si poate fi vizualizat in orice moment."
)

OPTIONS=(
  "Exit"
  "Urmareste progres"
  "Laborator 3 - Comenzi Linux"
  "Laborator 4 - Expresii regulate"
  "Laborator 5 - Procese"
  "Laborator 6 - Sistem de fisiere"
  "Laborator 7 - Utilizatori"
  "Laborator 8 - Permisiuni"
  "Laborator 9 - Retea"
  "Laborator 10 - Scripturi bash"
)

# function for displaying welcoming message
show_intro() {
  
  local counter=0

  for line in "${INTRO[@]}"; 
  do
    if [ $counter -eq 0 ]
    then
        echo -e "${CYAN}${line}${NC}"
    else
        echo -e "${YELLOW}${line}${NC}"
    fi

    counter=1

  done
  
  echo
}

# function for displaying main menu options
show_options() {
  
  echo -e "${GREEN}=== MENIU PRINCIPAL ===${NC}\n"
  
  for i in "${!OPTIONS[@]}"; 
  do
    echo "$((i+1)). ${OPTIONS[$i]}"
  done

  echo
}
