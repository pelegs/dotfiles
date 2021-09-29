#!/usr/bin/env zsh

file="/home/pelegs/.config/i3status-rust/config.toml"
SCRNUM=$(sed -n 13p $file | grep -o '[0-9]')
NEWNUM=$((($SCRNUM+1)%3))
SEDCMD="13s/$SCRNUM/$NEWNUM/"
sed -i $SEDCMD $file
swaymsg reload
