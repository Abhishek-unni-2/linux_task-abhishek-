#!/bin/bash

echo" Image Downloader"
echo "------------------"


mkdir -p downloaded_images


read -p "Download ALL images from game.csv? (y/n): " choice

if [[ "$choice" =~ ^[yY] ]]; then
    echo " Downloading ALL images..."
    while read -r url; do
        if [[ "$url" = http* ]]; then  
            wget -q "$url" -P downloaded_images/
            echo "Downloaded: $(basename "$url")"
        fi
    done < game.csv
    echo " Done! Check the 'downloaded_images' folder"
else
    echo "xxxxxxx Nothing downloaded"
fi
