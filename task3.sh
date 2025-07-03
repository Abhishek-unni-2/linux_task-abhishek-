  #!/bin/bash

echo "Select an option:"
echo "1) Encrypt a file"
echo "2) Decrypt a file"
read -p "Enter choice [1/2]: " choice

case "$choice" in
  1)
    read -p "Enter filename to encrypt: " file
    if [[ -f "$file" ]]; then
      gpg -c "$file"
      echo "Encryption complete: $file.gpg"
    else
      echo "File not found."
    fi
    ;;
  2)
    read -p "Enter filename to decrypt (.gpg): " file
    if [[ -f "$file" ]]; then
      gpg "$file"
      echo "Decryption complete."
    else
      echo "File not found."
    fi
    ;;
  *)
    echo "Invalid choice."
    ;;
esac

