#!/bin/bash

THEME_NAME="Felpsor"
THEME_SIZE=32

ICONS_PATH="$HOME/.local/share/icons"

# I need to rename each layer of wait
# They look like this: wait(Camada $) _0001.svg
# They should look like this: wait$.svg

WAIT_PATH="$PWD/hyprcursors/wait"

for file in "$WAIT_PATH"/wait\(Camada\ *\)*.svg; do
  filename=$(basename "$file")

  layer_id="${filename#wait(Camada }"
  layer_id="${layer_id%) _*.svg}"
  new_name="wait${layer_id}.svg"

  mv -n "$file" "$WAIT_PATH/$new_name"
done

echo "Compiling cursor: $THEME_NAME"
yes | hyprcursor-util --create $PWD -o $ICONS_PATH

echo "Setting cursor: $THEME_NAME, $THEME_SIZE"
hyprctl setcursor $THEME_NAME $THEME_SIZE
