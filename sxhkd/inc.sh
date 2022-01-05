input_key=$1
current_key=$(cat ~/.config/sxhkd/inc.key)

if [ "$input_key" == "$current_key" ]
then
    value=$(($(cat ~/.config/sxhkd/inc.value)*2))
else
    echo $input_key > ~/.config/sxhkd/inc.key
    value=1
fi

echo $value > ~/.config/sxhkd/inc.value
echo $value
