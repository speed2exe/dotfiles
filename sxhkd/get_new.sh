# Get info of current state
desk=$(bspc query -D -d)
node=$(bspc query -N -n)
recep=$(bspc query -N -n 'any.leaf.!window')

# invoke rofi to get result window
rofi -show combi -show-icons -sidebar-mode -steal-focus

# Check if the desktop of node(result) gotten through rofi is same as before
result_desk=$(bspc query -D -d focused)
if [ $result_desk == $desk ]
then
    exit 0
fi

# Create recep at result_window
bspc node -i

# Insert into source node if there is not recep, else insert at recep
if  [ $recep ] 
then
    bspc node -n $recep --follow
else
    bspc node -n $node --follow
fi
