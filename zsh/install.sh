#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing zsh"
sudo apt install zsh

echo "Setting the .zshrc symlink"
ln -sf $currentDirectory/zshrc ~/.zshrc

exit 0
