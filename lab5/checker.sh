#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab5"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab5_output.txt"

# flag detection
USER_FLAG_FILE="$TARGET_DIR/pid.txt"
EXPECTED_FLAG=$(pgrep -f "ping -i 4 -c 300 82.137.12.53")

# colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

chmod 000 "$HOME/Documents"

# function for updating the progress
update_progress() {
    chmod 755 "$HOME/Documents"
    sed -i "s/^${PROGRESS_VAR}=0$/${PROGRESS_VAR}=1/" "$PROGRESS_FILE"
    chmod 000 "$HOME/Documents"
}

# message to display after solving CTF
show_message() {
    tput cr
    echo -e "\n${GREEN}[✔] Ati rezolvat exercitiul! Felicitari!${NC}"
    echo
    tput cr
    echo "Introduceti comanda exit pentru a reveni la meniu..."
}

# function to check if the target process is the only one of its type
is_only_ping() {
    local count
    count=$(pgrep -fc "ping")

    if [[ "$count" -eq 1 ]]; then
        return 0 
    else
        return 1
    fi
}

# checker loop
while true; do
    sleep 1

    if [[ -f "$USER_FLAG_FILE" ]]; then
        contents=$(<"$USER_FLAG_FILE")
        clean_content=$(echo "$contents" | tr -d '\r\n[:space:]')

        if [[ "$clean_content" == "$EXPECTED_FLAG" ]]; then
            if is_only_ping; then
                show_message
                update_progress
                exit 0
            fi
        fi
    fi

done

cleanup