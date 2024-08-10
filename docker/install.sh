#!/bin/bash

currentDirectory=$(cd $(dirname "$0") >/dev/null 2>&1; pwd -P)

echo "Installing Docker"
curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker $USER
rm get-docker.sh

exit 0
