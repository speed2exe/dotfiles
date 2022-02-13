echo "world" > /tmp/result.txt
choices=$(ls ~/.config/sxhkd/shortcuts | sed "s/ /\n/g")
chosen=$(echo $choices | rofi -p "shortcuts" -steal-focus -dmenu -theme-str 'window{width:15%;}')
~/.config/sxhkd/shortcuts/"$chosen"
