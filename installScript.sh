#!/bin/bash
WALLPAPER_DEST="~/Pictures/wallpapers/"

echo "Installing neccessary packages"
sudo pacman -S --needed - < pkglist.txt

echo "Copying Hypyland Config"

cp -r ./hyprConfig/* ~/.config/hypr/

if ! command -v eww 2>&1 >/dev/null
then
  echo "Cloning Eww (Elkowar's Wacky Widgets) Repo"

  git clone https://github.com/elkowar/eww ./ewwRepo

  cd ewwRepo

  echo "Building Repo"

  cargo build --release --no-default-features --features=wayland

  chmod +x ./target/release/eww

  cp ./target/release/eww /bin/eww

  cd ..

  rm -rf ewwRepo;

fi


echo "Copying Eww Config"

if [ ! -d ~/.config/eww ]; then mkdir ~/.config/eww ; fi && cp -r ./ewwConfig/* ~/.config/eww/

echo "Copying Alacritty Config"

if [ ! -d ~/.config/alacritty ]; then mkdir ~/.config/alacritty ; fi && cp -r ./alacrittyConfig/* ~/.config/alacritty/

echo "Copying Zellij Config"

if [ ! -d ~/.config/zellij ]; then mkdir ~/.config/zellij ; fi && cp -r ./zellijConfig/* ~/.config/zellij/

echo "Copying Wallpapers"

 if [ ! -d $WALLPAPER_DEST ]; then mkdir -p $WALLPAPER_DEST ; fi && cp -r ./wallpapers/* $WALLPAPER_DEST 

# copy hypr config to the hypr folder
# install eww
# copy eww widgets to eww
# cop the alacritty folder to alacritty
# copy the wallpapers folder to wherever it's decided
# copy zellij to it's config
