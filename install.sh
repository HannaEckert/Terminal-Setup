#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

##################
# The main tools #
##################

$currentDirectory/zsh/install.sh && \
$currentDirectory/starship/install.sh && \
$currentDirectory/bat/install.sh && \
$currentDirectory/docker/install.sh && \
$currentDirectory/eza/install.sh && \
$currentDirectory/btop/install.sh && \
$currentDirectory/git/install.sh && \
$currentDirectory/lazygit/install.sh && \
$currentDirectory/tmux/install.sh && \
$currentDirectory/neovim/install.sh 


#################
# Various tools #
#################

# Simple packages
yay -S --needed --noconfirm \
	curl \
	extra/fd \
	ripgrep \
	zsh-autosuggestions \
	zoxide \
	fzf \
	lazydocker \
	less \
	mandoc \
	cht.sh-git \
	ttf-jetbrains-mono-nerd
	
exit 0
