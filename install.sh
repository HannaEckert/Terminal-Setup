#!/bin/bash

currentDirectory=$(dirname $0)


##################
# The main tools #
##################

$currentDirectory/zsh/install.sh && \
$currentDirectory/starship/install.sh && \
$currentDirectory/git/install.sh && \
$currentDirectory/tmux/install.sh && \
$currentDirectory/neovim/install.sh && \
$currentDirectory/jetBrainsMono/install.sh


#################
# Various tools #
#################

# Simple packages
sudo apt install \
	curl \
	exa \ # Awesome ls replacement 
	bat \ # Nicer looking cat
	fd-find \ 
	zsh-autosuggestions \ 
	thefuck \ # Typo fixer
	fzf # Fuzzy find

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

exit 0
