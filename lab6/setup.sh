#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab6"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab6_output.txt"

# reset progress
sed -i "s/^${PROGRESS_VAR}=1$/${PROGRESS_VAR}=0/" "$PROGRESS_FILE"

# creating directories
mkdir -p "$TARGET_DIR/directory"
for subdir in dir1 dir2 dir3; do
    mkdir -p "$TARGET_DIR/directory/$subdir"
done

# array shuffler
shuffle_array() {
    local tmp=("${arr[@]}")
    arr=( "${tmp[2]}" "${tmp[5]}" "${tmp[0]}" "${tmp[8]}" "${tmp[1]}" \
          "${tmp[6]}" "${tmp[3]}" "${tmp[9]}" "${tmp[4]}" "${tmp[7]}" )
}

# populating files
index=1
for subdir in dir1 dir2 dir3; do
    for i in {1..30}; do
        file="$TARGET_DIR/directory/$subdir/file${index}.txt"

        base=$(( (index * 13) % 950 + 1 ))
        arr=($(seq "$base" $((base + 9))))
        shuffle_array

        printf "%s\n" "${arr[@]}" > "$file"

        if (( index % 3 == 0 || index % 5 == 0 )); then
            chmod 444 "$file"
        else
            chmod 644 "$file"
        fi

        if [[ $index -eq 5 ]]; then
            touch -m -d "2000-01-01 00:00:00" "$file"
            touch -a -d "2025-07-13 23:59:00" "$file"
            max_value=$(printf "%s\n" "${arr[@]}" | sort -n | tail -1)
        else
            touch -m -d "2024-01-$(( (index % 28) + 1 )) 10:00:00" "$file"
            touch -a -d "2024-01-$(( (index % 28) + 1 )) 12:00:00" "$file"
        fi

        index=$((index + 1))
    done
done