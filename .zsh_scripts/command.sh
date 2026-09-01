#!/bin/bash

# Read all the files under this directory and prints the instructions

## commands - List commands availables

echo "Zsh Scripts List"

# Lines beginning with '## ' document a command; print them without the marker.
find ~/.zsh_scripts -type f | while read -r file; do
    while read -r line; do
      if [[ $line == '## '* ]]; then
        echo "${line#'## '}"
      fi
    done < "$file"
done

