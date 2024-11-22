#!/bin/bash

# Specify the file with the list of packages
PACKAGE_LIST="custom_apps.lst"

# Check if the file exists
if [[ ! -f $PACKAGE_LIST ]]; then
    echo "Error: $PACKAGE_LIST not found."
    exit 1
fi

# Read and install each package using yay
while IFS= read -r package; do
    # Skip empty lines and lines starting with '#'
    if [[ -n "$package" && ! "$package" =~ ^# ]]; then
        echo "Installing: $package"
        yay -S --needed --noconfirm "$package"
    fi
done < "$PACKAGE_LIST"
