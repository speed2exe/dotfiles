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
options="$shutdown\n$hibernate\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | rofi -p "powered menu" -steal-focus -dmenu -l 6 -theme-str 'window{width:15%;}')"
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

