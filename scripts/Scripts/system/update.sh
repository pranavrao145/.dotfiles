#!/usr/bin/env bash

# update packages
doas pacman -Syyu --noconfirm && paru -Syyu --noconfirm

# update neovim
cd /home/cypher/Programming/neovim/ && git fetch --all && git rebase origin/master && doas make distclean && doas make CMAKE_BUILD_TYPE=RelWithDebInfo && doas make install
