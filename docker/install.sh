#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing Docker"
yay -S --needed --noconfirm docker
sudo usermod -aG docker $USER

exit 0
