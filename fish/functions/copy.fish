function copy
    if [ (count $argv) -eq 0 ]
        read -z > /tmp/.clipboard
        xclip -sel clip /tmp/.clipboard
    else
        $argv | copy
    end
end
