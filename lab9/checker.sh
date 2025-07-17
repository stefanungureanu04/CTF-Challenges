#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab9"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab9_output.txt"

# ip configuration detection
IFACE="enp0s3"
EXPECTED_IP="192.168.100.100"
EXPECTED_ROUTE="192.168.100.1"

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

    ip_ok=$(ip a show "$IFACE" | grep -c "$EXPECTED_IP/24")
    route_ok=$(ip route | grep -c "default via $EXPECTED_ROUTE dev $IFACE")

    if [[ "$ip_ok" -ge 1 && "$route_ok" -ge 1 ]]; then
        show_message
        update_progress
        exit 0
    fi
done

cleanup