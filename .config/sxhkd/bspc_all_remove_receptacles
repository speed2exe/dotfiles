#!/usr/bin/env bash

for win in $(bspc query -N -n '.local.leaf.!window')
do
    bspc node $win --kill
done
