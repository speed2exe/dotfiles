unique=$(date -Iseconds)
mkdir ~/screenshots/
file="$HOME/screenshots/${unique}.png"

ts=$(date +%s)
# countdown
countdown () {
	for sec in `seq $1 -1 1`; do
		dunstify -t 1100 --replace=$ts "screenshot in : $sec" &
		sleep 1
	done
}

# take shots
shotnow () {
	sleep 0.5 && maim -f png "$file"
}

shot5 () {
	countdown '5'
	sleep 1 && maim -f png "$file"
}

shot10 () {
	countdown '10'
	sleep 1 && maim -f png "$file"
}

shotwin () {
	maim -f png -i `xdotool getactivewindow` "$file"
}

shotarea () {
	maim -f png -s "$file"
}

# Options
desktop=desktop
area=area
window=window
infive="5 Seconds"
inten="10 Seconds"
options="$desktop\n$area\n$window\n$infive\n$inten"
chosen="$(echo -e "$options" | rofi -steal-focus -l 5 -p 'screenshot' -dmenu -theme-str 'window {width:15%;}')"
case $chosen in
    $desktop)
		shotnow
        ;;
    $area)
		shotarea
        ;;
    $window)
		shotwin
		;;
    $infive)
		shot5
		;;
    $inten)
		shot10
        ;;
    *) exit 1 ;;
esac

xclip -selection clipboard -t image/png "$file"
pinta "$file"
