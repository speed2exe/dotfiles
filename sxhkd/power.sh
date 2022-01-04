uptime=$(uptime -p)
dunstify "$uptime"

# Options
shutdown="shutdown"
hibernate="hibernate"
reboot="reboot"
lock="lock"
suspend="suspend"
logout="logout"

# Variable passed to rofi
options="$lock\n$logout\n$suspend\n$hibernate\n$shutdown\n$reboot\n"

chosen="$(echo -e "$options" | rofi -p "power menu" -steal-focus -dmenu -l 6 -theme-str 'window{width:15%;}')"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $hibernate)
        systemctl hibernate
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        bsplock
        ;;
    $suspend)
        betterlockscreen --suspend
        ;;
    $logout)
        bspc quit
        ;;
esac
