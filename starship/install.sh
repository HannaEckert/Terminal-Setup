#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing Starship"
yay -S --needed --noconfirm starship

echo "Setting the config symlink"
mkdir -p ~/.config
ln -sf $currentDirectory/starship.toml ~/.config/

exit 0
