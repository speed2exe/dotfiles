echo "systemctl restart bluetooth.service
sleep 1
bluetoothctl connect F4:4E:FD:85:A8:FA
exit" > /tmp/.cmd

bspc rule -a \* -o state=floating && kitty
