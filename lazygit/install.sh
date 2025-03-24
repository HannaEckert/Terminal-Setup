#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing lazygit"
yay -S --needed --noconfirm lazygit

echo "Setting up the config"
mkdir -p ~/.config/lazygit
ln -sf $currentDirectory/config.yml ~/.config/lazygit

exit 0
