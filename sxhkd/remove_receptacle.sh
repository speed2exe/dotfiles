for win in $(bspc query -N -n '.local.leaf.!window')
do
    bspc node $win -k
done
