#!/bin/env sh
recep=$(bspc query -N -n 'biggest.local.leaf.!window')
bspc node -n $recep
