# Folder 
Locations of these folders are important.

## scripts 
script files should go in `~/.local/bin/`

## hyprland
Hyprland config files should go in `~/.config/hypr/`

## waybar
waybar config files should go in `~/.config/waybar/`

## fish
fish config files should go in `~/.config/fish/`

## dunst
dunst config files should go in `~/.config/dunst/`

## tmux
tmux config files should go in `~/.config/tmux/`

## yazi
yazi config files should go in `~/.config/yazi/`

## script-data
script-data files should go in `~/Documents/script-data/`

## wallpapers
wallpaper images should go in `~/wallpaper/`

_Most of these wallpapers were found using wallhaven.cc_

# Dependencies
Config files and/or scripts use these programs.

This is not an exhaustive list, as I'm sure I'll miss something. 

- waybar
- rofi
- pipewire
- hyprpicker
- ffmpeg
- dunst
- foliate
- evince
- swww
- cowsay
- hyprshot
- bat
- yazi

# Help

Sometimes boot stuff gets messed up. Have a usb with an Arch ISO to boot from. Then to fix: 
1. Mount File Systems 
    `mount -o compress=zstd,subvol=@ /dev/sda2 /mnt`
    `mount -o compress=zstd,subvol=@home /dev/sda2 /mnt/home`
    `mount /dev/sda1 /mnt/efi`
*Might not be sda, use `lsblk` to check*

2. Use `arch-chroot` on /mnt

3. Remake grub files 
    `sudo grub-mkconfig -o /boot/grub/grub.cfg` 
