#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab8"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab8_output.txt"

# function for cleaning up the OS after execution
cleanup() {
    chmod 755 "$HOME/Documents"
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