#!/bin/bash

THEME_NAME="Felpsor"
THEME_SIZE=32

ICONS_PATH="$HOME/.local/share/icons"

echo "Compiling cursor: $THEME_NAME"
yes | hyprcursor-util --create $PWD -o $ICONS_PATH

echo "Setting cursor: $THEME_NAME, $THEME_SIZE"
hyprctl setcursor $THEME_NAME $THEME_SIZE
