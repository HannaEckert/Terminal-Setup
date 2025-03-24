#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing zsh"
yay -S --needed --noconfirm zsh

echo "Setting the .zshrc symlink"
mkdir -p ~/.config
ln -sf $currentDirectory/zshrc ~/.zshrc
ln -sf $currentDirectory/zsh ~/.config/zsh

exit 0
