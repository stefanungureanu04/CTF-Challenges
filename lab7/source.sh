#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab7"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab7_output.txt"

# function for cleaning up the OS after exection
cleanup() {

    chmod 755 "$HOME/Documents"

    for u in $(awk -F: '$3 >= 2020 && $3 <= 2100 {print $1}' /etc/passwd); do
        HOMEDIR=$(getent passwd "$u" | cut -d: -f6)
        sudo userdel "$u" 2>/dev/null
        [[ -n "$HOMEDIR" && -d "$HOMEDIR" ]] && sudo rm -rf "$HOMEDIR"
    done

    for g in $(awk -F: '$3 >= 2020 && $3 <= 2100 {print $1}' /etc/group); do
        sudo groupdel "$g" 2>/dev/null
    done

    sudo rm -rf /home/devusers

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