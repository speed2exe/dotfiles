#!/bin/env sh

desk=$(bspc query -D -d)
rofi -show combi -show-icons -sidebar-mode -steal-focus

desk_then=$(bspc query -D -d)
if [ $desk_then != $desk ]
then
    bspc node -i
fi

bspc node -d $desk --follow
