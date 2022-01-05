dir=$1
hor=$2
ver=$3
node=$(bspc query -N -n)

mul=$(($(~/.config/sxhkd/inc.sh "$node$dir$hor$ver")))
hor=$(($mul*$hor))
ver=$(($mul*$ver))
bspc node -z $dir $hor $ver
