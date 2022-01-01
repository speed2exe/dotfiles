unique=$(date -Iseconds)
dir="`xdg-user-dir PICTURES`/Screenshots"
file="Screenshot_${unique}.png"

# Options
screen=screen
area=area
window=window
infive="5 Seconds"
inten="10 Seconds"

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
	cd ${dir} && sleep 0.5 && maim -f png "$file"
}

shot5 () {
	countdown '5'
	sleep 1 && cd ${dir} && maim -f png "$file"
}

shot10 () {
	countdown '10'
	sleep 1 && cd ${dir} && maim -f png "$file"
}

shotwin () {
	cd ${dir} && maim -f png -i `xdotool getactivewindow` "$file"
}

shotarea () {
	cd ${dir} && maim -f png -s "$file"
}

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# Variable passed to rofi
options="$screen\n$area\n$window\n$infive\n$inten"

#chosen="$(echo -e "$options" | $rofi_command -p 'Take Screenshot' -dmenu -selected-row 0)"
chosen="$(echo -e "$options" | rofi -p 'screenshot type' -dmenu -theme-str 'window {width:15%;}')"
case $chosen in
    $screen)
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

xclip -selection clipboard -t image/png ${dir}/"$file"
pinta ${dir}/"$file"
