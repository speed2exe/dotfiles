#!/usr/bin/env bash

dir=$1
hor=$2
ver=$3
node=$(bspc query -N -n)

mul=$(($(~/.config/sxhkd/inc.sh "$node$dir$hor$ver")))
hor=$(($mul*$hor))
ver=$(($mul*$ver))

oppo_dir=$(~/.config/sxhkd/opposite.sh $dir)
if ! $(bspc node -z $oppo_dir $hor $ver)
then
    compass_dir=$(~/.config/sxhkd/arrow_to_compass.sh $oppo_dir)
    ~/.config/sxhkd/auto_recep.sh $compass_dir
fi

bspc node -z $dir $hor $ver
