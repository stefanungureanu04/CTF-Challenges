#!/bin/bash

# global parameters and setup initialisation
USERNAME=$(whoami)
DIR="$(cd "$(dirname "$0")" && pwd)"

PROGRESS_DIR="$DIR/database"
PROGRESS_FILE="$PROGRESS_DIR/progress_${USERNAME}.txt"

mkdir -p "$PROGRESS_DIR"
touch "$PROGRESS_FILE"

# extracting data from infos file
source "$DIR/utils/metadata.sh"
bash "$DIR/utils/initialiser.sh" "$PROGRESS_FILE"


# menu main loop
clear

while true 
do

  show_intro

  show_options

  read -p "Alegeti o optiune [1-10]: " opt
  echo

  case $opt in
    1)
      echo -e "${CYAN}Multumim pentru utilizare. Spor la invatat, $USERNAME!\n${NC}"
      exit 0
      ;;
    2)
      clear
      bash "$DIR/utils/progress.sh" "$PROGRESS_FILE"
      ;;
    3)
      bash "$DIR/../lab3/menu.sh" "$PROGRESS_FILE"
      ;;
    4)
      bash "$DIR/../lab4/menu.sh" "$PROGRESS_FILE"
      ;;
    5)
      bash "$DIR/../lab5/menu.sh" "$PROGRESS_FILE"
      ;;
    6)
      bash "$DIR/../lab6/menu.sh" "$PROGRESS_FILE"
      ;;
    7)
      bash "$DIR/../lab7/menu.sh" "$PROGRESS_FILE"
      ;;
    8)
      bash "$DIR/../lab8/menu.sh" "$PROGRESS_FILE"
      ;;
    9)
      bash "$DIR/../lab9/menu.sh" "$PROGRESS_FILE"
      ;;
    10)
      bash "$DIR/../lab10/menu.sh" "$PROGRESS_FILE"
      ;;
    *)
      echo -e "${YELLOW}Optiune invalida. Va rugam incearcati din nou.${NC}"
      sleep 1
      clear
      ;;
  esac
done

