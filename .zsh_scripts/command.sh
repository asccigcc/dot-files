#!/bin/bash

# Read all the files under this directory and prints the instructions

## commands - List commands availables

commands=()

echo "Zsh Scripts List"

for file in $(find ~/.zsh_scripts -type f); do
    while read line; do
      if [[ $line == \##* ]]; then
        cleaned="${line/###/}"
        echo "$cleaned"
      fi
    done < "$file"
done

