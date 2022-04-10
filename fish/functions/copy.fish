function copy
    if [ (count $argv) -eq 0 ]
        read -z > /tmp/.clipboard
    else
        $argv | copy
    end
end
