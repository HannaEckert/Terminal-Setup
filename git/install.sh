#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing git"
sudo apt install git

echo "Setting the .gitconfig symlink"
ln -sf $currentDirectory/gitconfig ~/.gitconfig
cp $currentDirectory/gituserconfig ~/.gituserconfig

exit 0
