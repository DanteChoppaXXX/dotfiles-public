#!/bin/bash
echo "[!] Oh-My-Posh Installation for linux [!]"
echo
sleep 1
# Download the correct binary for Linux (replace the URL with the latest version if needed)
echo "[+] Downloading the correct binary for Linux... [+]"
wget https://github.com/JanDeDobbeleer/Oh-my-posh/releases/latest/download/posh-linux-amd64 -O oh-my-posh

sleep 1
echo
# Make the binary executable
echo "[+] Making the binary executable [+]"
chmod +x oh-my-posh

# Move the binary to a directory in your PATH
echo
echo "[+] Moving the binary to /usr/local/bin/... [+]"
sudo mv oh-my-posh /usr/local/bin/

# Check Oh My Posh version to verify installation
echo
echo "[!] Version [!]"
oh-my-posh --version

echo
echo "[!] Finally configure Oh-my-posh for your shell, then reload your shell config [!]"

# Configuration example for fish shell.
#mkdir -p ~/.poshthemes

 # Download the desired prompt theme
# curl -Lo ~/.poshthemes/alien.omp.json https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/alien.omp.json

# Edit fish config file "~/.config/fish/config.fish"
#oh-my-posh init fish --config ~/.poshthemes/alien.omp.json | source

# Reload config after making any changes
#exec fish
