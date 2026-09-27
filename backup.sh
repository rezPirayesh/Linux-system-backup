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

    while true; do
        read -r -p "Choose a number: " choice

        if [[ ! "$choice" =~ ^[0-9]+$ ]]; then
            echo "Invalid input. Please enter a number."
            continue
        fi

        if [ "$choice" -lt 1 ] || [ "$choice" -gt "${#matches[@]}" ]; then
            echo "Invalid choice. Please choose a number from 1 to ${#matches[@]}."
            continue
        fi

        source="${matches[$((choice - 1))]}"
        break
    done
fi

echo "Selected: $source"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

name=$(basename "$source")

backup_dir="backups"

if ! mkdir -p "$backup_dir"; then
    echo "Error: Could not create backup directory."
    exit 1
fi

backup_name="$backup_dir/${name}_${timestamp}.tar"

if tar -cf "$backup_name" "$source"; then
    echo "Backup created: $backup_name"
else
    echo "Error: Backup failed."
    exit 1
fi
