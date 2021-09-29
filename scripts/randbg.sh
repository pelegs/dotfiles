#!/usr/bin/env zsh

folder="/home/pelegs/wallpapers"
file="$folder/$(ls $folder | shuf -n 1)"
bgsymlink="$folder/BG"
rm -f $bgsymlink
ln -s $file $bgsymlink
