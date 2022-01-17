dir=$1
case $dir in
    'top')
        echo 'bottom'
        ;;
    'bottom')
        echo 'top'
        ;;
    'left')
		echo 'right'
		;;
    'right')
		echo 'left'
		;;
    *) exit 1 ;;
esac
