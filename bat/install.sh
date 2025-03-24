#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing bat"
yay -S --needed --noconfirm bat

echo "Installing the Catppuccin Frappe theme"
mkdir -p "$(bat --config-dir)/themes"
cp "$currentDirectory/Catppuccin Frappe.tmTheme" $(bat --config-dir)/themes

bat cache --build

echo "Making a symlink to the config file"
ln -sf $currentDirectory/config ~/.config/bat/


exit 0
