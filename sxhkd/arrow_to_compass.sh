arrow=$1
case $arrow in
    'top')
        echo 'north'
        ;;
    'bottom')
        echo 'south'
        ;;
    'left')
		echo 'west'
		;;
    'right')
		echo 'east'
		;;
    *) exit 1 ;;
esac
