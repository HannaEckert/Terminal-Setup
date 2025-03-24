#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing eza"
yay -S --needed --noconfirm eza

mkdir -p ~/.config/eza
ln -sf $currentDirectory/theme.yml ~/.config/eza/

exit 0
