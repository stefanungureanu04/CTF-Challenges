# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# lab content
CONTENT=(
    "=== Laborator 10 - Scripturi bash ===\n"
    "Tematici principale:"
    "- Scrierea si executarea scripturilor shell"
    "- Variabile, instructiuni conditionale si bucle"
    "- Citirea argumentelor din linia de comanda"
    "- Comenzi utile: read, echo, test, case, while"
)

# exercise
CHALLENGE=(
    "=== CTF: Scripturi Linux ===\n"
    "Completati si rulati script.sh astfel incat sa genereze primele"
    "10 numere prime din sirul lui Fibonacci si sa le oglindeasca."
    "Sirul lui Fibonacci este dat de recurenta f(n+2) = f(n+1) + f(n) cu n[0]=0 si n[1]=1"
    "Un numar este prim daca se divide doar pe sine insusi si pe 1."
    "Oglinditul unui numar reprezinta numarul respectiv scris cu cifrele in ordine inversa (123 -> 321)"
    "Afisarea numerelor se va face sub forma: f[0]-f[1]-f[2]-...f[n]"
    ""
    "Acordati drepturi de executie scriptului."
    ""
    "Scriptul trebuie scrie vectorul astfel obtinut in fisierul ~/Desktop/CHALLENGE/fibonacci.txt"
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