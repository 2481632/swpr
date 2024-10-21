#!/usr/bin/env bash


export XDG_RUNTIME_DIR=/run/usr/1000
export WAYLAND_DISPLAY="wayland-1"
notify-send "Wallpaper updated"
hours=$(date +%H)
$HOME/.local/bin/swww img "$HOME/.local/share/sunpaper/images/cliffs/${hours}.jpg" --transition-type wipe --transition-angle 220 > $HOME/.cache/swww.log 2>&1 &

