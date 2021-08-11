#!/usr/bin/env bash

pacman -Qqen > /home/cypher/.dotfiles/package-lists/pkglist.txt
pacman -Qqem > /home/cypher/.dotfiles/package-lists/foreignpkglist.txt
