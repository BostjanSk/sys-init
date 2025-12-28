#!/usr/bin/env bash

# A simple Bash script to update the system and install a list of common apps
# Run with: sudo 
# Customize the packages list as needed

# Exit on any error
set -e

echo "Install universal app manager"
# Check if 'app' command is already available
if command -v app >/dev/null 2>&1; then
    echo "'app' is already installed. Skipping installation."
else
    curl -sL https://hkdb.github.io/app/getapp.sh | bash
    # Optional: Verify installation succeeded
    if command -v app >/dev/null 2>&1; then
        echo "Installation successful!"
    else
        echo "Installation failed." >&2
        exit 1
    fi
fi

source ~/.bashrc

echo "Updating package lists..."
app -m app update

echo "Upgrading existing packages..."
app upgrade all


echo "Installing applications..."


app install chezmoi
app install  bitwarden

echo "Installation complete!"
echo "You may want to reboot or install additional snaps/flatpaks manually."

