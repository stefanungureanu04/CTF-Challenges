#!/bin/bash

# environment variables
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab10"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab10_output.txt"

# reset progress
sed -i "s/^${PROGRESS_VAR}=1$/${PROGRESS_VAR}=0/" "$PROGRESS_FILE"

# creating directories
mkdir -p "$TARGET_DIR"
touch "$TARGET_DIR/script.sh"

# starting the script...
echo "#!/bin/bash" > "$TARGET_DIR/script.sh"