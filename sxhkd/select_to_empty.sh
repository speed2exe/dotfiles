desk=$(bspc query -D -d)
(nohup ~/.config/sxhkd/create_empty_and_save.sh) 2>/dev/null &
rofi -show combi -show-icons -sidebar-mode -steal-focus
sleep 0.2
desk_after=$(bspc query -D -d)
node_after=$(bspc query -N -n)
blank_node=$(cat ~/.config/sxhkd/blank.tmp)
bspc node -s $blank_node --follow
if [ $desk == $desk_after ]
then
    if [ $blank_node == $node_after ]
    then
        exit 0
    fi

    if [ $desk_after != 'N' ]
        bspc node $node -k
    then
    fi
fi
