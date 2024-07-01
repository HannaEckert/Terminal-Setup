#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing tmux"
sudo apt install tmux

echo "Setting the symlink"
mkdir -p ~/.config/tmux
ln -sf $currentDirectory/tmux.conf ~/.config/tmux/

exit 0
