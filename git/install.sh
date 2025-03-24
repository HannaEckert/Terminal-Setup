#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing git"
yay -S --needed --noconfirm git

echo "Setting the .gitconfig symlink"
ln -sf $currentDirectory/gitconfig ~/.gitconfig
cp $currentDirectory/gituserconfig ~/.gituserconfig

exit 0
