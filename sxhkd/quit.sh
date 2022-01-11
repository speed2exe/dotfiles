desk_name=$(bspc query -D -d --names)
if [ $desk_name != 'N' ]
then
    bspc node -i
fi

bspc node -c
