#!/bin/bash

 #the directory to organize
target_dir=~/Downloads  # You can change this to any folder

#Go to that directory
cd "$target_dir" || exit

#  Creating required folders if they don't exist
mkdir -p Images Documents Music Videos Code Others

# Loop through all files in the folder
for file in *; do
    if [[ -f "$file" ]]; then  # Check if it's a regular file
        extension="${file##*.}"  # Extract file extension
        
        case "$extension" in
            jpg|jpeg|png) mv "$file" Images/ ;;
            pdf|doc|docx|txt) mv "$file" Documents/ ;;
            mp3|wav) mv "$file" Music/ ;;
            mp4|mkv) mv "$file" Videos/ ;;
            c|cpp|py|sh|js|html) mv "$file" Code/ ;;
            *) mv "$file" Others/ ;;  # If none match, move to Others
        esac
    fi
done

echo "✅ Files organized successfully!"
