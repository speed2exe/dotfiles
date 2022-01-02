#!/bin/env sh

desk=$(bspc query -D -d focused)
rofi -show combi -show-icons -sidebar-mode -steal-focus
bspc node -d $desk --follow
