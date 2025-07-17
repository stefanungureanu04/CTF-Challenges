#!/bin/bash

# parameter identification
PROGRESS_FILE="$1"

# current directory detection
DIR="$(cd "$(dirname "$0")" && pwd)"

# extracting data from metadata file
source "$DIR/metadata.sh"

# menu start
clear

while true
do
    show_lab_content

    show_ctf

    read -p "Acceptati provocarea? (Y/n): " choice
    echo

    if [[ "$choice" == "N"  || "$choice" == "n" ]]; then
      clear
      break
    else
      clear
      bash "$DIR/source.sh" "$PROGRESS_FILE"
      echo
      clear
    fi

    echo
done





