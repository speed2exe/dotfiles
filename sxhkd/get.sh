#!/bin/env sh

desk=$(bspc query -D -d)
rofi -show combi -show-icons -sidebar-mode -steal-focus
bspc node -d $desk --follow
