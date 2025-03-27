#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing neovim"
yay -S --needed --noconfirm \
	neovim \
	golang-go \
	nodejs \
	npm \
	bc \
	wget \
	openbsd-netcat

mkdir -p ~/.config
ln -sf $currentDirectory/nvim ~/.config/

exit 0
