#!/bin/bash

read -r -p "Enter the name of the file or directory to backup: " target

mapfile -t matches < <(find "$HOME" -name "$target" -print)

if [ "${#matches[@]}" -eq 0 ]; then
    echo "No match found."
    exit 1

elif [ "${#matches[@]}" -eq 1 ]; then
    source="${matches[0]}"

else
    echo "Multiple matches found:"

    for i in "${!matches[@]}"; do
        echo "$((i + 1))) ${matches[$i]}"
    done

    read -r -p "Choose a number: " choice
    source="${matches[$((choice - 1))]}"
fi

echo "Selected: $source"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

name=$(basename "$source")

backup_name="${name}_${timestamp}.tar"

tar -cf "$backup_name" "$source"

echo "Backup created: $backup_name"
