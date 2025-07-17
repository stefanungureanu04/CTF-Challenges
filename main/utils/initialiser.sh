#!/bin/bash

# parameter identification
PROGRESS_FILE="$1"

# if file already exists, keep it at is it
if [ -s "$PROGRESS_FILE" ]
then
  exit 0
fi

# definition of labs and levels
LABS=(lab3 lab4 lab5 lab6 lab7 lab8 lab9 lab10)

# initialising values
for lab in "${LABS[@]}"; 
do
    echo "${lab}=0" >> "$PROGRESS_FILE"
done