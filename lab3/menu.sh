#!/bin/bash

# parameter identification
PROGRESS_FILE="$1"

# current directory detection
DIR="$(cd "$(dirname "$0")" && pwd)"

# extracting data from metadata file
source "$DIR/metadata.sh"

# menu start
clear

while true
do
    show_lab_content

    show_ctf_options

    read -p "Selectie [0-$(( ${#EASY[@]} + ${#MEDIUM[@]} + ${#HARD[@]} ))]: " choice
    echo

    if [[ "$choice" == "0" ]]; then
      clear
      break
    elif [[ "$choice" == "1" ]]; then
        clear
        bash "$DIR/easy1.sh" "$PROGRESS_FILE"
        echo
        clear
    elif [[ "$choice" =~ ^[0-9]+$ && "$choice" -ge 1 && "$choice" -le $(( ${#EASY[@]} + ${#MEDIUM[@]} + ${#HARD[@]} )) ]]; then
      clear
      echo "Exercitiul $choice este momentan indisponibil."
      read -p "Apasa ENTER pentru a reveni..."
      clear
    else
      echo -e "${YELLOW}Optiune invalida.${NC}"
      sleep 1
      clear
    fi

    echo
done





