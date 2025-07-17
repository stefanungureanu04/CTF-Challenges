#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab7"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab7_output.txt"

# expected configuration
USERNAME="ion_popescu"
UID_EXPECTED="2025"
GID_EXPECTED="2025"
GROUP="family"
HOMEDIR="/home/acasa/ion_popescu"

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

# checker loop
while true; do
    sleep 1

    if id "$USERNAME" &>/dev/null; then
        uid=$(id -u "$USERNAME")
        gid=$(id -g "$USERNAME")
        entry=$(getent passwd "$USERNAME")
        shell=$(echo "$entry" | cut -d: -f7)
        home=$(echo "$entry" | cut -d: -f6)

        if [[ "$uid" == "$UID_EXPECTED" ]] &&
        [[ "$gid" == "$GID_EXPECTED" ]] &&
        [[ "$shell" == "/bin/bash" ]] &&
        [[ "$home" == "$HOMEDIR" ]] &&
        [[ -d "$home" ]] &&
        [[ "$(stat -c %a "$home")" == "755" ]] &&
        [[ "$(stat -c %U "$home")" == "$USERNAME" ]] &&
        [[ "$(stat -c %G "$home")" == "$GROUP" ]] &&
        getent group "$GROUP" | grep -q ":$GID_EXPECTED:"; then

            show_message
            update_progress
            exit 0
        fi

    fi
done

cleanup