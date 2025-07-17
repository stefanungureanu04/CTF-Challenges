#!/bin/bash

# environment parameters
DIR="$(dirname "$0")"
PROGRESS_FILE="$1"
PROGRESS_VAR="lab8"
TARGET_DIR="$HOME/Desktop/CHALLENGE"
OUTPUT_LOG="/tmp/lab8_output.txt"

# reset progress
sed -i "s/^${PROGRESS_VAR}=1$/${PROGRESS_VAR}=0/" "$PROGRESS_FILE"

# creating directories
mkdir -p "$TARGET_DIR/workspace"
touch "$TARGET_DIR/workspace/execute_me.sh"
touch "$TARGET_DIR/workspace/secret.txt"
touch "$TARGET_DIR/workspace/backup.log"

# file configuration
chmod -s "$WORKDIR/execute_me.sh" 2>/dev/null
chmod -t "$WORKDIR" 2>/dev/null
setfacl -b "$WORKDIR/secret.txt" 2>/dev/null

# create helper script
cat << 'EOF' > "$TARGET_DIR/workspace/check.sh"
#!/bin/bash

if [[ -f ~/Desktop/CHALLENGE/flag.txt ]]; then
    rm ~/Desktop/CHALLENGE/flag.txt
fi

touch ~/Desktop/CHALLENGE/flag.txt

files=(
  "$HOME/Desktop/CHALLENGE/workspace/execute_me.sh"
  "$HOME/Desktop/CHALLENGE/workspace/secret.txt"
  "$HOME/Desktop/CHALLENGE/workspace/backup.log"
)

sum=0

for file in "${files[@]}"; do
  if [[ -e "$file" ]]; then
    permissions=$(stat -c "%a" "$file")
    sum=$((sum + 10#$permissions))
  else
    echo "Fisierul $file nu exista."
    exit 1
  fi
done

echo "$sum" > ~/Desktop/CHALLENGE/flag.txt
EOF

chmod +x "$TARGET_DIR/workspace/check.sh"