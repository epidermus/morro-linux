#!/bin/bash

pacman -S --needed - < pkglist.txt

WALLPAPER_DEST="~/Pictures/wallpapers/"

#install eww

cp -r ./hyprConfig/* ~/.config/hypr/

git clone https://github.com/elkowar/eww ./ewwRepo

cd ewwRepo

cargo build --release --no-default-features --features=wayland

chmod +x ./target/release/eww

cp ./target/release/eww /bin/eww

cd ..

cp -r ./ewwConfig/* ~/.config/eww/


cp -r ./alacrittyConfig/* ~/.config/alacritty/

cp -r ./zellijConfig/* ~/.config/zellij/

mkdir -p $WALLPAPER_DEST && cp -r ./wallpapers/* $WALLPAPER_DEST 

# copy hypr config to the hypr folder
# install eww
# copy eww widgets to eww
# cop the alacritty folder to alacritty
# copy the wallpapers folder to wherever it's decided
# copy zellij to it's config
