#!/bin/bash

# parameter identification
PROGRESS_FILE="$1"

# colors
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

while true
do
    clear
    echo -e "${CYAN}=== Exercitiul 1 (EASY) ===${NC}"
    echo
    echo "Scrie o comanda care afiseaza 'hello world' pe ecran."
    echo "Introdu comanda mai jos:"
    read -p "> " user_cmd

    # Salvam comanda utilizatorului temporar
    echo "$user_cmd" > /tmp/ctf_user_cmd_lab3_easy1.sh
    chmod +x /tmp/ctf_user_cmd_lab3_easy1.sh
    
    echo
    echo "Verificare in curs..."
    sleep 1

    # Apelam checker
    bash "$(dirname "$0")/chk_easy1.sh" "$PROGRESS_FILE"
    result=$?

    if [[ "$result" -eq 0 ]]; 
    then
        echo
        read -p "✔️  Exercitiu finalizat cu succes. Apasa ENTER pentru a reveni la meniu..." dummy
        break
    else
        echo
        read -p "❌  Apasa R pentru a reincerca sau ENTER pentru a reveni la meniu: " retry
        if [[ "$retry" != "R" && "$retry" != "r" ]]; 
        then
            break
        fi
    fi
done
