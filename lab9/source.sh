#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab9"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab9_output.txt"

# function for cleaning up the OS after exection
cleanup() {
    chmod 755 "$HOME/Documents"

    BACKUP_DIR="$TARGET_DIR/.backup"

    sudo ip addr flush dev enp0s3

    OLD_IP=$(grep -oP 'inet \K[\d.]+/\d+' "$BACKUP_DIR/ip_before.txt" | head -n1)

    if [[ -n "$OLD_IP" ]]; then
        sudo ip addr add "$OLD_IP" dev enp0s3
    fi

    sudo ip route del default 2>/dev/null

    OLD_ROUTE=$(grep "^default via" "$BACKUP_DIR/route_before.txt" | head -n1)

    if [[ -n "$OLD_ROUTE" ]]; then
        sudo ip route add $OLD_ROUTE
    fi

    rm -rf "$TARGET_DIR"
    rm "$OUTPUT_LOG"
}

# building up the exercise
bash "$DIR/setup.sh" "$PROGRESS_FILE"

# lansare sesiune xterm cu checker în fundal
xterm -e bash -c "
    cd \$HOME
    bash \"$DIR/checker.sh\" \"$PROGRESS_FILE\" &
    script -q -f \"$OUTPUT_LOG\"
    exec bash --login -i
"

cleanup