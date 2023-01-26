function bluetooth_reset
    systemctl restart bluetooth.service
    sleep 1

    bluetoothctl devices | while read -l a b c 
        bluetoothctl connect $b
    end
end
