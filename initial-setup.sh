#!/usr/bin/env bash

# fiss ^* First install setup script for anhacks nixos deployment
echo "=========================="
echo -e "   \e[1;34mInitial Setup Script\e[0m"
echo "=========================="

# Add default channel
DEFAULT_CHANNEL="nixos-unstable"
echo -e "\e[1;34m1-\e[0m Adding nix channel \"${DEFAULT_CHANNEL}\" as default"
nix-channel --add https://nixos.org/channels/${DEFAULT_CHANNEL} nixos
echo -e "\e[1;32mDone\e[0m"

echo -e "\e[1;34m1-\e[0m Updating that channel (Requires elevated privileges)"
sudo nix-channel --update nixos
echo -e "\e[1;32mDone\e[0m"

# Build home directory structure
HOME_DIR="/home/anhack"
echo -e "\e[1;34m1-\e[0m Creating directory tree structure under \"${HOME_DIR}\""
mkdir -p "${HOME_DIR}/Documents"
mkdir -p "${HOME_DIR}/Documents/Notes"
mkdir -p "${HOME_DIR}/Documents/Legal"
mkdir -p "${HOME_DIR}/Documents/Info"
mkdir -p "${HOME_DIR}/Pictures"
mkdir -p "${HOME_DIR}/Pictures/Dumps"
mkdir -p "${HOME_DIR}/Pictures/Edits"
mkdir -p "${HOME_DIR}/Pictures/Sketches"
mkdir -p "${HOME_DIR}/Pictures/Designs"
mkdir -p "${HOME_DIR}/Pictures/Designs/Logos"
mkdir -p "${HOME_DIR}/Pictures/Designs/Icons"
mkdir -p "${HOME_DIR}/Pictures/Downloads"
mkdir -p "${HOME_DIR}/Pictures/Downloads/Memes"
mkdir -p "${HOME_DIR}/Pictures/Screenshots"
mkdir -p "${HOME_DIR}/Videos"
mkdir -p "${HOME_DIR}/Videos/Dumps"
mkdir -p "${HOME_DIR}/Videos/Edits"
mkdir -p "${HOME_DIR}/Videos/Movies"
mkdir -p "${HOME_DIR}/Videos/Downloads"
mkdir -p "${HOME_DIR}/Music"
mkdir -p "${HOME_DIR}/Downloads"
mkdir -p "${HOME_DIR}/Public"
mkdir -p "${HOME_DIR}/Desktop"
mkdir -p "${HOME_DIR}/Backups"
mkdir -p "${HOME_DIR}/Meshes"
mkdir -p "${HOME_DIR}/Repos"
echo -e "\e[1;32mDone\e[0m"

echo -e "\n\e[30;44m*-\e[0m If you haven't already now would be a good time to rebuild using this config"
echo -e "Run \e[1;36msudo nixos-rebuild switch --flake .#{HOST_NAME}\e[0m from this directory"
echo -e "Available host names are in the file \"\e[1;34mflake.nix\e[0m\" in this directory under \"\e[1;34mnixosConfigurations\e[0m\""
