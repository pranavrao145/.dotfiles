#!/usr/bin/env bash

# update packages
sudo pacman -Syyu --noconfirm && paru -Syyu --noconfirm

# update neovim
cd /home/cypher/Programming/neovim/ && git pull --rebase origin master && sudo make distclean && sudo make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install

# update Hyprland
cd /home/cypher/Programming/Hyprland/ && git pull --rebase origin main && sudo make clear && git submodule update --init --recursive && sudo make install
