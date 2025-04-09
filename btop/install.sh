#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing eza"
yay -S --needed --noconfirm btop

mkdir -p ~/.config/btop/themes
ln -sf $currentDirectory/btop.conf ~/.config/btop/
cp $currentDirectory/catppuccin_frappe.theme ~/.config/btop/themes

exit 0
