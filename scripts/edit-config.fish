#!/usr/bin/env fish

echo "Choose a config to edit"
echo "1. nvim"
echo "2. hyprland"
echo "3. waybar"

read -f -P "Enter [1-3]: " choice

set -f original_dir (pwd)

if [ "$choice" = "1" ]
    cd ~/.config/nvim
else if [ "$choice" = "2" ]
    cd ~/.config/hypr
else if [ "$choice" = "3" ]
    cd ~/.config/waybar
else
    echo "Unknown choice given"
    echo "exiting..."
    exit 1
end

nvim

cd $original_dir
