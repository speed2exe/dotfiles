input_key=$1
current_key=$(cat /tmp/inc.key)

if [ "$input_key" == "$current_key" ]
then
    value=$(($(cat /tmp/inc.value)*2))
else
    echo $input_key > /tmp/inc.key
    value=1
fi

echo $value > /tmp/inc.value
echo $value
