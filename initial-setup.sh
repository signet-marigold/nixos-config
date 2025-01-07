#!/usr/bin/env bash

# It is a flake based system so you do not need a default channel
# because it is declared explicitly inside of our flake.
# But... we still do need a channel if we want auto-completion on 'nix-shell'
DEFAULT_CHANNEL="nixos-24.11"
REBUILD_COMMAND="nixos-rebuild --use-remote-sudo switch --flake .#${TARGET_HOSTNAME} --upgrade"
HOME_DIR="/home/anhack"


# fiss ^* First install setup script for anhacks nixos deployment
echo "=========================="
echo -e "   \e[1;34mInitial Setup Script\e[0m"
echo "=========================="

echo ""
echo "hai !!"
echo "Welcome to alex's init system bootstrapper script!"
echo ""
echo "First things first..."
echo "What host is nixos being installed into?"

# Get a list of hosts from the config
HOSTS=$(for dir in hosts/*/; do echo "$dir" | sed 's/^hosts\///' | sed 's/\/$//'; done)

echo -ne "\e[1;34m1-\e[0m Available Hostnames: "
printf '%s ' ${HOSTS}
echo ""

echo "=========================="

# Get user hostname selection
read -p "Enter the Target Hostname : " TARGET_HOSTNAME

# Check if user input is a host that exists
if [[ " ${HOSTS[*]} " =~ [[:space:]]${TARGET_HOSTNAME}[[:space:]] ]]; then
    echo -e "\n\e[30;44m*-\e[0m Running config with hostname \"${TARGET_HOSTNAME}\""
    echo -e "\e[1;32mDone\e[0m"
    echo ""
else
    echo -e "\n\e[30;44m*Hostname not found. Please run the configuration again\e[0m"
    exit 1
fi

# Copy hardware config
echo -e "\e[1;34m1-\e[0m Moving this hosts hardware config to the git tree"
echo "[copy /etc/nixos/hardware-configuration.nix -> ./hosts/${TARGET_HOSTNAME}]"
cp /etc/nixos/hardware-configuration.nix ./hosts/${TARGET_HOSTNAME}/
echo -e "\e[1;32mDone\e[0m"
echo ""

# Remove default config and add symlink to flake
if test -f ./hosts/${TARGET_HOSTNAME}/hardware-configuration.nix; then
    echo -e "\e[1;34m1-\e[0m Removing old configuration"
    sudo rm -r /etc/nixos/*
    echo -e "\e[1;32mDone\e[0m"
    echo ""
else
    echo -e "\n\e[30;44m*Failed to copy hardware config\e[0m"
    exit 1
fi

echo "=========================="

# NixOS rebuild
echo -e "\e[1;34m1-\e[0m Rebuilding nixos (Requires elevated privileges)"
nix-shell -p git --run ${REBUILD_COMMAND}
echo -e "\e[1;32mDone\e[0m"
echo ""

# Add default channel
echo -e "\e[1;34m1-\e[0m Adding nix channel \"${DEFAULT_CHANNEL}\" as default"
nix-channel --add https://nixos.org/channels/${DEFAULT_CHANNEL} nixos
echo -e "\e[1;32mDone\e[0m"
echo ""

echo "=========================="

echo -e "\e[1;34m1-\e[0m Updating that channel (Requires elevated privileges)"
sudo nix-channel --update nixos
echo -e "\e[1;32mDone\e[0m"
echo ""

# Build home directory structure
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
mkdir -p "${HOME_DIR}/Share"
echo -e "\e[1;32mDone\e[0m"
echo ""

echo "=========================="

echo -e "\e[1;34m1-\e[0m Virtual network service autostart (Requires elevated privileges)"
sudo virsh net-autostart default
echo -e "\e[1;32mDone\e[0m"
echo ""

echo "=========================="

echo -e "\e[1;32mAll Done!\e[0m"
echo "Thank you for using me, and have a great day!"
echo ""
echo "=========================="

echo "Next step is to place the host's public ssh key into '.sops.yaml' and rebuild 'secrets.yaml' with the sops command"
echo "and then run rebuild again"
echo "( ${REBUILD_COMMAND} )"
