#!/bin/bash

wowDir="$HOME/Games/battlenet/drive_c/Program Files (x86)/World of Warcraft/_retail_"
destinationDir="$HOME/gdrive/archlinux-backup"
wowDestinationDir="$destinationDir/wow"
homeDestinationDir="$destinationDir/home"

mkdir -p "$destinationDir"

# Copiando arquivos do WoW
nohup rclone copy "$wowDir/Interface/AddOns" "$wowDestinationDir/Interface/AddOns" > /tmp/rclone-wow-addons.log 2>&1 &
nohup rclone copy "$wowDir/WTF" "$wowDestinationDir/WTF" > /tmp/rclone-wow-wtf.log 2>&1 &

# Copiando arquivos da home
nohup rclone copy "$HOME/.ssh" "$homeDestinationDir/.ssh" > /tmp/rclone-ssh.log 2>&1 &
nohup rclone copy "$HOME/.config/rclone" "$homeDestinationDir/.config/rclone" > /tmp/rclone-config-rclone.log 2>&1 &
nohup rclone copy "$HOME/.config/datagrip" "$homeDestinationDir/.config/datagrip" > /tmp/rclone-config-datagrip.log 2>&1 &
nohup rclone copy "$HOME/.zsh_history" "$homeDestinationDir/.zsh_history" > /tmp/rclone-zsh-history.log 2>&1 &
nohup rclone copy "$HOME/.local/share/fonts" "$homeDestinationDir/.local/share/fonts" > /tmp/rclone-fonts.log 2>&1 &
nohup rclone copy "$HOME/.gitconfig" "$homeDestinationDir/" > /tmp/rclone-gitconfig.log 2>&1 &
nohup rclone copy "$HOME/developer/books" "$homeDestinationDir/developer/books" > /tmp/rclone-books.log 2>&1 &

# Salvando lista de apps do flatpak e pacotes AUR
flatpak list --app --columns=application | awk '{print "flatpak install " $1}' > "$destinationDir/flatpak-apps.txt"
paru -Qe | awk '{print $1}' > "$destinationDir/aur-packages.txt"
