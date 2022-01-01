uptime=$(uptime)
dunstify "$uptime"

# Options
shutdown="shutdown"
reboot="reboot"
lock="lock"
suspend="suspend"
logout="logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | rofi -p "power menu" -dmenu -l 5 -theme-str 'window{width:15%;}')"
case $chosen in
    $shutdown)
        systemctl poweroff > result.txt
        ;;
    $reboot)
        systemctl reboot > result.txt
        ;;
    $lock)
        bsplock > result.txt
        ;;
    $suspend)
        betterlockscreen --suspend > result.txt
        ;;
    $logout)
        bspc quit > result.txt
        ;;
esac

