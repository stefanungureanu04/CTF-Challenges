# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# lab content
CONTENT=(
    "=== Laborator 6 - Sistem de fisiere ===\n"
    "Tematici principale:"
    "- Structura arborescenta si ierarhia directorilor"
    "- Tipuri de fisiere: regular, directory, link, device"
    "- Comenzi: stat, file, find"
    "- Inoduri si legaturi simbolice vs. hard links"
)

# exercise
CHALLENGE=(
    "=== CTF: Fisiere Linux ===\n"
    "Intr-o ierarhie de fisiere dir se afla un fisier misterios,"
    "accesat recent dar modificat acum mult timp."
    "Acest fisier indeplineste urmatoarele conditii:"
    " - A fost modificat cel mai demult (modification time)"
    " - A fost accesat cel mai recent (access time)"
    " - Are permisiunile r--r--r--"
    "Toate fisierele din ierarhie contin cate 10 numere "
    "intre 1 si 1000, ordonate aleator. Flag-ul cautat"
    "este valoarea maxima din fisierul astfel identificat"
    ""
    "Scrieti rezultatul in fisierul ~/Desktop/CHALLENGE/number.txt"

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