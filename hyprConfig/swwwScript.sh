#!/bin/bash

swww-daemon -q &>/dev/null & disown;

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

swww img $WALLPAPER --transition-type outer --transition-fps 60 --transition-pos .9,.1

# Apply the selected wallpaper

while :
do
  sleep 300

    # Get a random wallpaper

    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    swww img $WALLPAPER --transition-type outer --transition-fps 60 --transition-pos .9,.1

    swww clear-cache
done
