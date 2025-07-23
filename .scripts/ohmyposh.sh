#!/bin/bash
# Oh-my-posh Installation for linux
# Download the correct binary for Linux (replace the URL with the latest version if needed)
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O oh-my-posh

# Make the binary executable
chmod +x oh-my-posh

# Move the binary to a directory in your PATH
sudo mv oh-my-posh /usr/local/bin/

# Check Oh My Posh version to verify installation
oh-my-posh --version

# Configure Oh-my-posh for fish
mkdir -p ~/.poshthemes

 # Download the desired prompt theme
# curl -Lo ~/.poshthemes/alien.omp.json https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/alien.omp.json

# Edit fish config file "~/.config/fish/config.fish"
oh-my-posh init fish --config ~/jandedobbeleer.omp.json | source

# Reload config after making any changes
exec fish
