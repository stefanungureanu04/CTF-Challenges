#!/bin/bash

# parameter identification
PROGRESS_FILE="$1"

# Culori
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Executam comanda utilizatorului
output=$(bash /tmp/ctf_user_cmd_lab3_easy1.sh 2>/dev/null)

# Verificare dummy (hello world)
if [[ "$output" == "hello world" ]]; then
  echo -e "${GREEN}[✔] Comanda corecta!${NC}"
  sed -i 's/^lab3_easy1=0$/lab3_easy1=1/' "$PROGRESS_FILE"
  exit 0
else
  echo -e "${RED}[✘] Comanda gresita. Output-ul a fost: '$output'${NC}"
  exit 1
fi
