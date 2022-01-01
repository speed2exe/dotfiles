#!/bin/env sh

desk=$(bspc query -D -d focused)
rofi -show combi
bspc node -d $desk --follow
