#!/bin/bash

currentDirectory=$(dirname $0)

echo "Installing neovim"
sudo apt install snapd
sudo snap install --classic nvim
sudo update-alternatives --set editor /snap/bin/nvim

mkdir ~/.config
ln -sf $currentDirectory/nvim ~/.config/

exit 0
