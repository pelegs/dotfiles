#!/usr/bin/env zsh

sudo pacman -Syu                 # main update
yes | sudo pacman -Scc           # clean cache
sudo pacman -Rns $(pacman -Qtdq) # clean orphans
rm -rf ~/.cache/*                # remove home cache
i3 restart
