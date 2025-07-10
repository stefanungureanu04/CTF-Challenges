# !/bin/bash

# colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

CONTENT=(
    "=== Laborator 8 - Permisiuni si securitate ===\n"
    "Tematici principale:"
    "- Permisiuni pe fisiere si directoare: rwx"
    "- Comenzi: chmod, chown, chgrp"
    "- Setuid, setgid si sticky bit"
    "- UMask si mostenirea permisiunilor"
)

EASY=(
    "Gaseste un fisier cu nume specific"
    "Numarul total de fisiere in directorul home"
    "Gaseste fisiere ascunse"
)

MEDIUM=(
    "Gaseste fisiere mai mici de 1KB modificate in ultimele 24h"
    "Numarul de procese ale utilizatorului curent"
    "Afiseaza permisiunile tuturor fisierelor din /tmp"
)

HARD=(
    "Gaseste un fisier cu dimensiune exacta si UID specific"
    "Analiza unui fisier de log pentru pattern specific"
    "Cauta fisiere cu setuid si afiseaza proprietarul"
)

