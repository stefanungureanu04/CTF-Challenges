#!/bin/bash

# environment variables
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab7"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab7_output.txt"

# reset progress
sed -i "s/^${PROGRESS_VAR}=1$/${PROGRESS_VAR}=0/" "$PROGRESS_FILE"

# creating directories
mkdir -p "$TARGET_DIR"