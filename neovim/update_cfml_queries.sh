#!/usr/bin/zsh
source ~/.config/zsh/beautiful_spinner.zsh

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

baseUrl="https://raw.githubusercontent.com/cfmleditor/tree-sitter-cfml/refs/heads/master/"
baseTargetPath="$HOME/.local/share/nvim/lazy/nvim-treesitter/queries"

for languageSubset in cfml cfhtml cfscript; do
	for feature in highlights injections; do
		downloadUrl="$baseUrl/$languageSubset/queries/$feature.scm" 
		targetPath="$baseTargetPath/$languageSubset"
		targetFile="$targetPath/$feature.scm"
	
		mkdir -p "$targetPath"

		set +m
		wget "$downloadUrl" -O "$targetFile" --no-check-certificate --quiet 2>&1 >/dev/null &
		showProcessIdentifier $! "Downloading $feature for $languageSubset"
		set -m
	done
done
