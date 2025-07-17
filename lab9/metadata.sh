# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# lab content
CONTENT=(
    "=== Laborator 9 - Retea si comunicatii ===\n"
    "Tematici principale:"
    "- Adrese IP, porturi, DNS, interfete"
    "- Comenzi: ifconfig, ip, netstat, ss, ping, traceroute"
    "- Diagnosticare retea si debugging conexiuni"
    "- Sockets si transferuri de fisiere"
)

# exercise
CHALLENGE=(
    "=== CTF: Comenzi Linux ===\n"
    "Ai preluat un sistem configurat incorect."
    "Echipa de tehnicieni are nevoie de tine pentru a"
    "restabili integritatea statiei de lucru."
    "Urmeaza instructiunile din directorul NetConfig"
    "si asigura setarea corecta a sistemului."
    ""
    "Checker-ul valideaza in timp real starea sistemului."
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