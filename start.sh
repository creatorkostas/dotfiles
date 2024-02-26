#!/bin/bash
echo "Backup (1)"
echo "Restore (2)"
read -p "--> " in
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
if [ $in -eq "1" ]
then
	rsync -PvrtpD --delete /etc/nixos/ ./NixOS/
    rsync -PvrtpD --delete ~/.config/dunst ./config/
    rsync -PvrtpD --delete ~/.config/hypr ./config/
    rsync -PvrtpD --delete ~/.config/rofi ./config/
    rsync -PvrtpD --delete ~/.config/waybar ./config/
    rsync -PvrtpD --delete ~/.config/nvim ./config/
    rsync -PvrtpD --delete ~/powerlevel10k ./home/
    rsync -PvrtpD --delete ~/Templates ./home/
    rsync -PvrtpD --delete ~/.bashrc ./home/
    rsync -PvrtpD --delete ~/.p10k.zsh ./home/
    rsync -PvrtpD --delete ~/.zshrc ./home/
fi

if [ $in -eq "2" ]
then
	rsync -PvrtpD --delete ./NixOS/ /etc/nixos/
    rsync -PvrtpD --delete ./config/dunst ~/.config/
    rsync -PvrtpD --delete ./config/hypr ~/.config/
    rsync -PvrtpD --delete ./config/rofi ~/.config/
    rsync -PvrtpD --delete ./config/waybar ~/.config/
    rsync -PvrtpD --delete ./config/nvim ~/.config/
    rsync -PvrtpD --delete ./home/powerlevel10k ~/
    rsync -PvrtpD --delete ./home/Templates ~/
    rsync -PvrtpD --delete ./home/.bashrc ~/
    rsync -PvrtpD --delete ./home/.zshrc ~/
    rsync -PvrtpD --delete ./home/.p10k.zsh ~/
fi




