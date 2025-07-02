#!/bin/bash

echo "What do you want to do?"
echo "1) Encrypt a file"
echo "2) Decrypt a file"
read -p "Choose an option (1 or 2): " choice

if [ "$choice" == "1" ]; then
    read -p "Enter the filename to encrypt: " file
    if [ -f "$file" ]; then
        gpg -c "$file"
        echo " Encryption complete. Encrypted file: $file.gpg"
    else
        echo " File not found!"
    fi
elif [ "$choice" == "2" ]; then
    read -p "Enter the filename to decrypt (with .gpg): " file
    if [ -f "$file" ]; then
        gpg "$file"
        echo " Decryption complete."
    else
        echo " File not found!"
    fi
else
    echo "Invalid choice, exiting."
fi
