#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

##################
# The main tools #
##################

$currentDirectory/zsh/install.sh && \
$currentDirectory/java/install.sh && \
$currentDirectory/starship/install.sh && \
$currentDirectory/bat/install.sh && \
$currentDirectory/docker/install.sh && \
$currentDirectory/eza/install.sh && \
$currentDirectory/git/install.sh && \
$currentDirectory/lazygit/install.sh && \
$currentDirectory/lazydocker/install.sh && \
$currentDirectory/tmux/install.sh && \
$currentDirectory/neovim/install.sh && \
$currentDirectory/jetBrainsMono/install.sh


#################
# Various tools #
#################

# Simple packages
sudo apt install \
	curl \
	fd-find \
	ripgrep \
	zsh-autosuggestions \ 
	thefuck # Typo fixer
	
# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

exit 0
