dir=$1

case "$dir" in
    "east")
        ratio=0.99
        ;;
    "south")
        ratio=0.99
        ;;
    "west")
        ratio=0.01
        ;;
    "north")
        ratio=0.01
        ;;
esac

bspc node -p $dir
bspc node -o $ratio
bspc node -i
