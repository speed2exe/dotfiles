#!/usr/bin/env bash

dir=$1
hor=$2
ver=$3
node=$(bspc query --nodes --node)

mul=$(($(~/.config/sxhkd/inc.sh "$node$dir$hor$ver")))
hor=$(($mul*$hor))
ver=$(($mul*$ver))
bspc node --resize $dir $hor $ver
