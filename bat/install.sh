#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing bat"
sudo apt install bat

echo "Installing the Catppuccin Frappe theme"
mkdir -p "$(batcat --config-dir)/themes"
cp "Catppuccin Frappe.tmTheme" $(batcat --config-dir)/themes

batcat cache --build

echo "Making a symlink to the config file"
ln -sf $currentDirectory/config ~/.config/bat/


exit 0
