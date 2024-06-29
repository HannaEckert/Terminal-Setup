#!/bin/bash

currentDirectory=$(dirname $0)

echo "Installing git"
sudo apt install git

echo "Setting the .gitconfig symlink"
ln -sf $currentDirectory/gitconfig ~/.gitconfig

exit 0
