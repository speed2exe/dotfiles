#!/bin/env sh

node=$(bspc query -N -n)
rofi -show combi -show-icons -sidebar-mode -steal-focus
bspc node -n $node --follow
