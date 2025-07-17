#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab5"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab5_output.txt"

# reset progress
sed -i "s/^${PROGRESS_VAR}=1$/${PROGRESS_VAR}=0/" "$PROGRESS_FILE"

# creating directories
mkdir -p "$TARGET_DIR"

# starting processes
ping -i 2 -c 200 1.1.1.1 > /dev/null &
ping -i 1 -c 500 8.8.8.8 > /dev/null &
ping -i 4 -c 100 82.137.12.53 > /dev/null &
ping -i 4 -c 300 82.137.12.53 > /dev/null &
ping -i 4 -c 300 10.0.0.1 > /dev/null &

# init sequence
sleep 1  
