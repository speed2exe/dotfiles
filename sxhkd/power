#!/usr/bin/env bash

uptime=$(uptime -p)
dunstify "$uptime"

# Options
lock="lock"
logout="logout"
shutdown="shutdown"
hibernate="hibernate"
reboot="reboot"
suspend="suspend"

options="$lock\n$logout\n$suspend\n$hibernate\n$reboot\n$shutdown"
chosen="$(echo -e "$options" | rofi -p "power menu" -steal-focus -dmenu -l 6 -theme-str 'window{width:15%;}')"
case $chosen in
    $lock)
        slock
        ;;
    $logout)
        killall bspwm
        ;;
    $suspend)
        systemctl suspend && slock
        ;;
    $hibernate)
        systemctl hibernate
        ;;
    $reboot)
        systemctl reboot
        ;;
    $shutdown)
        systemctl poweroff
        ;;
esac
