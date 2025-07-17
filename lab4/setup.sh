#!/bin/bash

# environment variables
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab4"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab4_output.txt"

# reset progress
sed -i "s/^${PROGRESS_VAR}=1$/${PROGRESS_VAR}=0/" "$PROGRESS_FILE"

# creating directories
mkdir -p "$TARGET_DIR/BankATM"
mkdir -p "$TARGET_DIR/BankATM/departamente"
touch "$TARGET_DIR/BankATM/organizare.txt"
touch "$TARGET_DIR/BankATM/angajati.txt"

# variables
departments=(
    "Marketing" 
    "Tehnic" 
    "ResurseUmane" 
    "Suport" 
    "Vanzari"
)

declare -A phones=(
    ["Andrei Popescu"]="0721000001"
    ["Maria Ionescu"]="0721000002"
    ["Ion Georgescu"]="0721000003"
    ["Elena Marinescu"]="0721000004"
    ["Dan Tudor"]="0721000005"
    ["Anca Dobre"]="0721000006"
    ["Mihai Enache"]="0721000007"
    ["Irina Pavel"]="0721000008"
    ["Cristian Ilie"]="0721000009"
    ["Raluca Serban"]="0721000010"
    ["Stefan Dumitru"]="0721000011"
    ["Lavinia Dragan"]="0721000012"
    ["Alexandru Radu"]="0721000013"
    ["Simona Gherghina"]="0721000014"
    ["George Nistor"]="0721000015"
    ["Oana Vlad"]="0721000016"
    ["Bogdan Lupu"]="0721000017"
    ["Diana Neagu"]="0721000018"
    ["Florin Jianu"]="0721000019"
    ["Laura Petrescu"]="0721000020"
    ["Vlad Costache"]="0721000021"
    ["Alina Stoica"]="0721000022"
    ["Catalin Preda"]="0721000023"
    ["Monica Zamfir"]="0721000024"
    ["Paul Ene"]="0721000025"
    ["Claudia Roman"]="0721000026"
    ["Dragos Mihalache"]="0721000027"
    ["Teodora Cristea"]="0721000028"
    ["Rares Munteanu"]="0721000029"
    ["Silvia Lupescu"]="0721000030"
    ["Sebastian Florescu"]="0721000031"
    ["Bianca Sandu"]="0721000032"
    ["Adrian Tomescu"]="0721000033"
    ["Camelia Pana"]="0721000034"
    ["Eduard Baciu"]="0721000035"
    ["Gabriela Toma"]="0721000036"
    ["Ionut Barbu"]="0721000037"
    ["Andreea Chirila"]="0721000038"
    ["Robert Diaconu"]="0721000039"
    ["Cristina Rusu"]="0721000040"
    ["Florentina Balan"]="0721000041"
    ["Lucian Marin"]="0721000042"
    ["Natalia Avram"]="0721000043"
    ["Cosmin Oprea"]="0721000044"
    ["Anisoara Cazan"]="0721000045"
    ["Tudor Petcu"]="0721000046"
    ["Ilinca Rosu"]="0721000047"
    ["Valentin Pop"]="0721000048"
    ["Carmen Iacob"]="0721000049"
    ["Octavian Stan"]="0721000050"
)

declare -A roles=(
    ["Andrei Popescu"]="Analist Credite"
    ["Maria Ionescu"]="Manager Cont"
    ["Ion Georgescu"]="Consilier Financiar"
    ["Elena Marinescu"]="Ofiter Credite"
    ["Dan Tudor"]="Manager Operatiuni"
    ["Anca Dobre"]="Casier"
    ["Mihai Enache"]="Supervizor"
    ["Irina Pavel"]="Consultant Clienti"
    ["Cristian Ilie"]="Responsabil Produse"
    ["Raluca Serban"]="Auditor Intern"
    ["Stefan Dumitru"]="Director Sucursala"
    ["Lavinia Dragan"]="Asistent Vanzari"
    ["Alexandru Radu"]="Specialist IT"
    ["Simona Gherghina"]="Manager Risc"
    ["George Nistor"]="Ofiter Conformitate"
    ["Oana Vlad"]="Expert Juridic"
    ["Bogdan Lupu"]="Economist"
    ["Diana Neagu"]="Manager HR"
    ["Florin Jianu"]="Operator Tranzactii"
    ["Laura Petrescu"]="Reprezentant Clienti"
    ["Vlad Costache"]="Analist Date"
    ["Alina Stoica"]="Inginer Sistem"
    ["Catalin Preda"]="Controlor Financiar"
    ["Monica Zamfir"]="Coordonator Marketing"
    ["Paul Ene"]="Consultant Asigurari"
    ["Claudia Roman"]="Planificator Financiar"
    ["Dragos Mihalache"]="Verificator Documente"
    ["Teodora Cristea"]="Consilier Juridic"
    ["Rares Munteanu"]="Manager Proiect"
    ["Silvia Lupescu"]="Coordonator Vanzari"
    ["Sebastian Florescu"]="Ofiter Relatii"
    ["Bianca Sandu"]="Evaluator Imobiliar"
    ["Adrian Tomescu"]="Coordonator IT"
    ["Camelia Pana"]="Asistent Manager"
    ["Eduard Baciu"]="Operator Plati"
    ["Gabriela Toma"]="Specialist Achizitii"
    ["Ionut Barbu"]="Administrator Retea"
    ["Andreea Chirila"]="Consilier Clienti"
    ["Robert Diaconu"]="Analist Risc"
    ["Cristina Rusu"]="Inspector Financiar"
    ["Florentina Balan"]="Specialist PR"
    ["Lucian Marin"]="Coordonator Training"
    ["Natalia Avram"]="Ofiter HR"
    ["Cosmin Oprea"]="Arhivator Documente"
    ["Anisoara Cazan"]="Consilier Bancar"
    ["Tudor Petcu"]="Supervizor Backoffice"
    ["Ilinca Rosu"]="Specialist Contabilitate"
    ["Valentin Pop"]="Verificator Rapoarte"
    ["Carmen Iacob"]="Auditor Extern"
    ["Octavian Stan"]="Planificator Strategic"
)

# populating files
declare it=1

for dept in "${departments[@]}"; do
    echo "Dept00${it} $dept" >> "$TARGET_DIR/BankATM/organizare.txt"
    touch "$TARGET_DIR/BankATM/departamente/dept00${it}.txt"
     it=$((it+1))
done

for name in "${!phones[@]}"; do
    echo "$name - ${phones[$name]}" >> "$TARGET_DIR/BankATM/angajati.txt"
done

it=0

for name in "${!roles[@]}"; do
    if [[ it -ge 0 && it -lt 10 ]]; then
        echo "$name - ${roles[$name]}" >> "$TARGET_DIR/BankATM/departamente/dept001.txt"
    elif [[ it -ge 10 && it -lt 20 ]]; then
        echo "$name - ${roles[$name]}" >> "$TARGET_DIR/BankATM/departamente/dept002.txt"
    elif [[ it -ge 20 && it -lt 30 ]]; then
        echo "$name - ${roles[$name]}" >> "$TARGET_DIR/BankATM/departamente/dept003.txt"
    elif [[ it -ge 30 && it -lt 40 ]]; then
        echo "$name - ${roles[$name]}" >> "$TARGET_DIR/BankATM/departamente/dept004.txt"
    elif [[ it -ge 40 && it -lt 50 ]]; then
        echo "$name - ${roles[$name]}" >> "$TARGET_DIR/BankATM/departamente/dept005.txt"
    fi
     it=$((it+1))
done