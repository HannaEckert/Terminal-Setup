#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing neovim"
sudo apt install snapd
sudo snap install --classic nvim

echo "Setting nvim as the default editor"
sudo snap alias nvim vim
sudo snap alias nvim vi

mkdir -p ~/.config
ln -sf $currentDirectory/nvim ~/.config/

exit 0
