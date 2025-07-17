# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# lab content
CONTENT=(
    "=== Laborator 3 - Comenzi Linux ===\n"
    "Tematici principale:"
    "- Navigare in sistemul de fisiere: cd, ls, pwd"
    "- Manipulare fisiere si directoare: cp, mv, rm, mkdir"
    "- Vizualizare continut: cat, less, head, tail"
    "- Redirectionari si concatenari: >, >>, |"
)

# exercise
CHALLENGE=(
    "=== CTF: Comenzi Linux ===\n"
    "Gasiti flag-ul ascuns dintr-un fisier text aflat intr-o ierarhie de directoare."
    "Flagul este pe linia 73 a unui fișier denumit file.txt aflat intr-un"
    "subdirector al directorului Desktop/CHALLENGE. Foloseste comenzile de baza din Linux"
    "studiate la laborator (cut, tail, head, cat, etc)"
    ""
    "Scrieti rezultatul in fisierul ~/Desktop/CHALLENGE/flag.txt"
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
