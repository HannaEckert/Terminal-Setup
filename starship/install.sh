#!/bin/bash

currentDirectory=$(dirname $0)

echo "Installing Starship"
curl -sS https://starship.rs/install.sh | sh

echo "Setting the config symlink"
ln -sf $currentDirectory/starship.toml ~/.config/

exit 0
