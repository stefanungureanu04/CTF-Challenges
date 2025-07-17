# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# lab content
CONTENT=(
    "=== Laborator 5 - Procese ===\n"
    "Tematici principale:"
    "- Ce este un proces. Procesul init"
    "- Comenzi: ps, top, htop, kill, nice, renice"
    "- Procesul in fundal si controlul joburilor"
    "- Statutul proceselor si terminarea controlata"
)

# exercise
CHALLENGE=(
    "=== CTF: Procese Linux ===\n"
    "Pe o statie de lucru ruleaza simultan mai multe procese ping."
    "Unul dintre acestea trimite ping-uri catre o adresă IP necunoscuta."
    ""
    "Identificati acest proces, stiind ca doar unul respecta cumulativ conditiile urmatoare:"
    " - A fost lansat de utilizatorul curent."
    " - Ruleaza in fundal."
    " - PID-ul său este mai mare decat 1000."
    " - Procesul trimite exact 300 de ping-uri."
    " - Intervalul este de 4 secunde între ping-uri."
    " - Tinta este o adresa IP din afara retelei locale."
    "Identificati flag-ul constand in PID-ul acestui proces si omorati celelalte procese ping."
    ""
    "Scrieti rezultatul in fisierul ~/Desktop/CHALLENGE/pid.txt"
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