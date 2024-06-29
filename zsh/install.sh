#!/bin/bash

currentDirectory=$(dirname $0)

echo "Installing zsh"
sudo apt install zsh

echo "Setting the .zshrc symlink"
ln -sf $currentDirectory/zshrc ~/.zshrc

exit 0
