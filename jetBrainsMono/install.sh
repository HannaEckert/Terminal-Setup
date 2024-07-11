#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing fontconfig"
sudo apt install fontconfig

echo "Installing JetBrainsMono NFM Regular"
sudo cp $currentDirectory/JetBrainsMonoNerdFontMono-Regular.ttf /usr/share/fonts/
fc-cache -f -v

exit 0
