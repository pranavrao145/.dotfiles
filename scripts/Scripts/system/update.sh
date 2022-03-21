#!/usr/bin/env bash

# update packages
sudo pacman -Syyu --noconfirm && paru -Syyu --noconfirm

# update neovim
cd /home/cypher/Programming/neovim/ && git fetch --all && git rebase origin/master && sudo make distclean && sudo make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
