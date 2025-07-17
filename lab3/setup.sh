#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab3"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab3_output.txt"

# reset progress
sed -i "s/^${PROGRESS_VAR}=1$/${PROGRESS_VAR}=0/" "$PROGRESS_FILE"

# creating directories
mkdir -p "$TARGET_DIR/.directory/dir"
touch "$TARGET_DIR/.directory/dir/file.txt"

# variable for generating the file
words=(
  lorem ipsum dolor sit amet consectetur adipiscing elit sed d0 eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim
)

# populating files
for i in {1..100}; do
    idx1=$(( ((i - 1) * 2) % 20 ))
    idx2=$(( (idx1 + 1) % 20 ))
    echo "linie $i - ${words[$idx1]}_${words[$idx2]}" >> "$TARGET_DIR/.directory/dir/file.txt"
done