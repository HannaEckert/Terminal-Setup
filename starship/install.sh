#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing Starship"
curl -sS https://starship.rs/install.sh | sh

echo "Setting the config symlink"
ln -sf $currentDirectory/starship.toml ~/.config/

exit 0
