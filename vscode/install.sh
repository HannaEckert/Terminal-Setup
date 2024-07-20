#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Setting the code-server settings symlinks"
ln -sf $currentDirectory/keybindings.json ~/.local/share/code-server/User/
ln -sf $currentDirectory/settings.json ~/.local/share/code-server/User/

exit 0
