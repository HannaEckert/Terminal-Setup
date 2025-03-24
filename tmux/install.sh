#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing tmux"
yay -S --needed --noconfirm tmux

echo "Setting the symlink"
mkdir -p ~/.config/tmux/plugins/tpm
ln -sf $currentDirectory/tmux.conf ~/.config/tmux/

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

exit 0
