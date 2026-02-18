#!/usr/bin/env bash

# Script for generating readme

IMG_DIR="../images"
OUT="../README.md"

echo "| Image | Image |" > "$OUT"
echo "|-------|-------|" >> "$OUT"

count=0

find "$IMG_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | sort | while read img; do
    if (( count % 2 == 0 )); then
        printf "| <img src=\"%s\" width=\"300\"> " "$img" >> "$OUT"
    else
        printf "| <img src=\"%s\" width=\"300\"> |\n" "$img" >> "$OUT"
    fi
    ((count++))
done

if (( count % 2 == 1 )); then
    echo "|" >> "$OUT"
fi
