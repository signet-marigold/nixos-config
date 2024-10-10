#!/usr/bin/env bash

HOME_DIR="/home/anhack"

# setup main structure
mkdir -p "${HOME_DIR}/Documents"
mkdir -p "${HOME_DIR}/Documents/Notes"
mkdir -p "${HOME_DIR}/Documents/Legal"
mkdir -p "${HOME_DIR}/Music"
mkdir -p "${HOME_DIR}/Pictures"
mkdir -p "${HOME_DIR}/Pictures/Screenshots"
mkdir -p "${HOME_DIR}/Videos"
mkdir -p "${HOME_DIR}/Repositories"
mkdir -p "${HOME_DIR}/Downloads"

# download delete warning
touch "${HOME_DIR}/Downloads/FILES_HERE_WILL_BE_AUTOMATICALLY_REMOVED"
