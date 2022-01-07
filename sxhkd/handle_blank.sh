tput civis

while true
do
    read -s -n 1 input

    input=($(echo $input | hexdump))
    input=${input[1]}
    case $input in
        "0a7f") # backspace
            exit 0
            ;;
        "000a") # space
            (nohup ~/.config/sxhkd/select_to_empty.sh) 2>/dev/null &
            sleep 0.1
            exit 0
            ;;
    esac
done
