#!/usr/bin/env bash

choices=$(ls ~/.config/sxhkd/shortcuts)
chosen=$(echo $choices | sed "s/ /\n/g" | rofi -p "shortcuts" -steal-focus -dmenu -theme-str 'window{width:15%;}')
~/.config/sxhkd/shortcuts/"$chosen"
