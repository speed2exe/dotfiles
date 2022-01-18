desk_name=$(bspc query -D -d --names)
if [ $desk_name == 'N' ]
then
    bspc node -c
else
    bspc node -d '^1'
fi
