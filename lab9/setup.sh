#!/bin/bash

# environment variables
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab9"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab9_output.txt"

# reset progress
sed -i "s/^${PROGRESS_VAR}=1$/${PROGRESS_VAR}=0/" "$PROGRESS_FILE"

# creating directories
mkdir -p "$TARGET_DIR/NetConfig"

# populating the file
echo "Interfata enp0s3 este configurata incorect.

Instructiuni:
 - Seteaza adresa IP: 192.168.100.100/24
 - Seteaza ruta default: 192.168.100.1 prin enp0s3

" > "$TARGET_DIR/NetConfig/instructiuni.txt"

# saving current configuration
mkdir -p "$TARGET_DIR/.backup"
ip addr show enp0s3 > "$TARGET_DIR/.backup/ip_before.txt"
ip route show > "$TARGET_DIR/.backup/route_before.txt"