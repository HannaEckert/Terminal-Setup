#!/bin/bash

currentDirectory=$(dirname $0)

echo "Installing tmux"
sudo apt install tmux

echo "Setting the symlink"
mkdir -p ~/.config/tmux
ln -sf $currentDirectory/tmux.conf ~/.config/tmux/

exit 0
