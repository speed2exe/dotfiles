#!/bin/env sh

recep=$(bspc query -N -n 'any.local.leaf.!window')
bspc node -n $recep
