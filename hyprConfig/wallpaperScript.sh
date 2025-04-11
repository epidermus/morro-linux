#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

while :
  do
    sleep 300
    CURRENT_WALL=$(hyprctl hyprpaper listloaded)

    # Get a random wallpaper that is not the current one
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 0)

    # Apply the selected wallpaper
    hyprctl hyprpaper reload ,"$WALLPAPER"

    hyprctl hyprpaper unload ,"$CURRENT_WALL"

    # sleep 5 minutes
  done
