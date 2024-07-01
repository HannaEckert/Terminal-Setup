#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing git"
sudo apt install git

echo "Setting the .gitconfig symlink"
ln -sf $currentDirectory/gitconfig ~/.gitconfig

echo "Installing the fzf-git module"
git clone https://github.com/junegunn/fzf-git.sh.git ~/.local/share/fzf-git

echo "Installing git-delta"
sudo dpkg -i $currentDirectory/git-delta_0.17.0_arm64.deb

exit 0
