#!/bin/bash

currentDirectory=$(dirname $0)

echo "Installing fontconfig"
sudo apt install fontconfig

echo "Installing JetBrainsMono NFM Regular"
cp $currentDirectory/JetBrainsMonoNerdFontMono-Regular.ttf /usr/share/fonts/
fc-cache -f -v

exit 0
