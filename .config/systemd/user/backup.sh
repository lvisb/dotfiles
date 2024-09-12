#!/bin/bash

wowDir="$HOME/Games/battlenet/drive_c/Program Files (x86)/World of Warcraft/_retail_"

destinationDir="$HOME/gdrive/archlinux-backup"
wowDestinationDir="$destinationDir/wow"
homeDestinationDir="$destinationDir/home"

mkdir -p "$destinationDir"

nohup rclone copy "$wowDir/Interface/AddOns" "$wowDestinationDir/Interface/AddOns" > /tmp/rclone.log 2>&1 &
nohup rclone copy "$wowDir/WTF" "$wowDestinationDir/WTF" > /tmp/rclone.log 2>&1 &
nohup rclone copy "$HOME/.ssh" "$homeDestinationDir/.ssh" > /tmp/rclone.log 2>&1 &
nohup rclone copy "$HOME/.config/rclone" "$homeDestinationDir/.config/rclone" > /tmp/rclone.log 2>&1 &
nohup rclone copy "$HOME/.config/datagrip" "$homeDestinationDir/.config/datagrip" > /tmp/rclone.log 2>&1 &
nohup rclone copy "$HOME/.zsh_history" "$homeDestinationDir/.zsh_history" > /tmp/rclone.log 2>&1 &
nohup rclone copy "$HOME/.local/share/fonts" "$homeDestinationDir/.local/share/fonts" > /tmp/rclone.log 2>&1 &

flatpak list --app --columns=application | awk '{print "flatpak install " $1}' > "$destinationDir/flatpak-apps.txt"
