#!/bin/bash

# This script simply updates Git to its current version

echo "It's beginning to update..."
echo " "
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
echo " "
echo "Done!"
