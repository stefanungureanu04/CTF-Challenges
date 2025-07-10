#!/bin/bash

# parameter identification
PROGRESS_FILE="$1"

# colors
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# function to show users progress
show_progress() {

    echo -e "${CYAN}╔═══════════════════════════════════════╗"
    echo -e "║        Progresul tau actual          ║"
    echo -e "╚═══════════════════════════════════════╝${NC}\n"

    total_done=0
    total_all=0

    for lab in {3..10}; 
    do
        echo -e "${BLUE}📘 Laboratorul $lab:${NC}"
        for level in easy medium hard; 
        do
            count_done=$(grep -c "^lab${lab}_${level}[1-3]=1" "$PROGRESS_FILE")
            count_all=$(grep -c "^lab${lab}_${level}[1-3]=" "$PROGRESS_FILE")
            echo -e "  - ${level^^}: ${count_done}/${count_all}"

            total_done=$((total_done + count_done))
            total_all=$((total_all + count_all))
        done
        echo
    done

    percent=$(( (100 * total_done) / total_all ))
    filled=$(( percent / 5 ))
    empty=$(( 20 - filled ))
    bar="$(printf '%0.s█' $(seq 1 $filled))$(printf '%0.s░' $(seq 1 $empty))"

    echo -e "${CYAN}Progres total: [${GREEN}${bar}${CYAN}] ${YELLOW}${percent}%${NC}"
}

show_progress

echo

# reseting the progress upon pressing 'R' or 'r'
read -p "Apasati tasta R pentru a reseta progresul sau ENTER pentru a reveni la meniul principal: " input

if [[ "$input" == "R" || "$input" == "r" ]];
then
    > "$PROGRESS_FILE"
    for lab in {3..10}; do
        for level in easy medium hard; 
        do
            for i in {1..3}; do
                echo "lab${lab}_${level}${i}=0" >> "$PROGRESS_FILE"
            done
        done
    done
    echo -e "${YELLOW}Progresul a fost resetat.${NC}"
    echo
    read -p "Apasa ENTER pentru a reveni..."
fi

clear

