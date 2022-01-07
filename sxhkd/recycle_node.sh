desk_name=$(bspc query -D -d --names)
if [ $desk_name == 'N' ]
then
    bspc node -c
else
    bspc node -i && bspc node -d '^1'
fi
