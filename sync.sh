#!/bin/bash

# Sync dot-files to the git repo
# Maintainer: asccigcc
#
# Usage:
#   ./sync.sh

# Prompt the user to confirm sync
echo -e "\xE2\x9A\x99 Sync Dot-files \xE2\x9A\x99"
echo "The following process will overwrite your git repo."
read -p "Do you want to proceed with the dot-files sync? [y/N] " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "Syncronization cancelled"
    exit 1
fi

# Load config variables
source config.txt

# Copy dot files
for file in "${files[@]}"; do
    # Check if the destination file already exists
    echo -e "Preparing sync the file: ${file_path}  \xE2\x9E\xA1"
    cp "${HOME}/${file}" "$file"
    echo "File ${HOME}/${file} copied to git repo"
done

# Copy dot directories
for dir in "${directories[@]}"; do
    echo -e "Preparing directory ${dir} to sync \xE2\x9E\xA1"
    cp -rf "${HOME}/${dir}" "$dir"
    echo "Directory ${HOME}/${dir} copied to git repo"
done

echo -e "Syncronization complete \xE2\x9A\xA1"

