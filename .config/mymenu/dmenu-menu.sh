#!/usr/bin/env bash

menu_dir="$HOME/.config/mymenu/dmenu-items"

menu_items=$(ls $HOME/.config/mymenu/dmenu-items | sed -e 's/dmenu-//' -e 's/.sh$//')

selected_item=$(echo "$menu_items" | bemenu -l 20)

file_name="dmenu-$selected_item.sh"

exec "$menu_dir/$file_name"


