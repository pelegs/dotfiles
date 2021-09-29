#!/usr/bin/env zsh

DATE=$(date +'%Y-%m-%d')
FOLDER="/run/media/pelegs/TapirBackup1/backups/root/$DATE"
mkdir $FOLDER
sudo rsync -a / $FOLDER
