#!/bin/bash

# Install and configure dot-files
# Maintainer: asccigcc
#
# Usage:
#   install.sh

# Prompt the user to confirm installation
echo -e "\xE2\x9A\x99 Installing Dot-files \xE2\x9A\x99"
echo "The following process will overwrite your current configuration."
read -p "Do you want to proceed with the dot-files installation? [y/N] " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "Installation cancelled"
    exit 1
fi

# Load config variables
source config.txt

for file in "${files[@]}"; do
    # Check if the destination file already exists
    echo -e "Preparing ${file_path} to install \xE2\x9E\xA1"
    if [ -f "${HOME}/${file}" ]; then
        echo "File ${HOME}/${file} already exists in destination."
        read -p "Do you want to overwrite it? [y/N] " overwrite
        if [[ $overwrite =~ ^[Yy]$ ]]; then
            cp "$file" "${HOME}/${file}"
            echo "File ${HOME}/${file} overwritten in destination"
        else
            echo "File ${HOME}/${file} not overwritten in destination"
        fi
    else
        cp "$file" "${HOME}/${file}"
        echo "File ${HOME}/${file} copied to destination"
    fi
done


for dir in "${directories[@]}"; do
    echo -e "Preparing directory ${dir} to install \xE2\x9E\xA1"
    if [ -d "${HOME}/${dir}" ]; then
        echo "File ${HOME}/${dir} already exists in destination."
        read -p "Do you want to overwrite it? [y/N] " overwrite
        if [[ $overwrite =~ ^[Yy]$ ]]; then
            cp -rf "$dir" "${HOME}/${dir}"
            echo "File ${HOME}/${dir} overwritten in destination"
        else
            echo "File ${HOME}/${dir} not overwritten in destination"
        fi
    else
        cp -rf "$dir" "${HOME}/${dir}"
        echo "File ${HOME}/${dir} copied to destination"
    fi
done

echo -e "Installation complete \xE2\x9A\xA1"

