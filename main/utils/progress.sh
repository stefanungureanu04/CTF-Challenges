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

show_progress_title_bar() {
    echo -e "${CYAN}╔═══════════════════════════════════════╗"
    echo -e "║        Progres actual          ║"
    echo -e "╚═══════════════════════════════════════╝${NC}\n"
}

show_progress_percentage_bar() {
    total_done="$1"
    total_all="$2"

    percent=$(( (100 * total_done) / total_all ))
    filled=$(( percent / 5 ))
    empty=$(( 20 - filled ))
    bar="$(printf '%0.s█' $(seq 1 $filled))$(printf '%0.s░' $(seq 1 $empty))"

    echo -e "${CYAN}Progres total: [${GREEN}${bar}${CYAN}] ${YELLOW}${percent}%${NC}"
}

# function to show users progress
show_progress() {

    show_progress_title_bar
    
    total_done=0
    total_all=0

    for it in {3..10}; 
    do
        echo -e "${BLUE}📘 Laboratorul $it:${NC}"
        count_done=$(grep -c "^lab${it}=1" "$PROGRESS_FILE")
        count_all=1

        status=""

        if [[ $count_done -ne 0 ]]; 
        then
            status="SOLVED✅"
        else
            status="UNSOLVED❌"
        fi

        echo -e "  - Status: $status"

        total_done=$((total_done + count_done))
        total_all=$((total_all + count_all))

        echo
    done

    show_progress_percentage_bar "$total_done" "$total_all"
}

# function to reset the progress
reset_progress() {

    read -p "Apasati tasta R pentru a reseta progresul sau ENTER pentru a reveni la meniul principal: " input

    if [[ "$input" == "R" || "$input" == "r" ]];
    then
        > "$PROGRESS_FILE"
        
        for lab in {3..10}; do
                echo "lab${lab}=0" >> "$PROGRESS_FILE"
        done

        echo -e "${YELLOW}Progresul a fost resetat.${NC}"
        echo
        read -p "Apasati ENTER pentru a reveni..."
    fi
}


# execution thread
show_progress

echo

reset_progress

clear

