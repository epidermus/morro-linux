#!/bin/bash

if  hyprctl clients | grep class:.Alacritty ; then
  alacritty msg create-window
else
  alacritty
fi
