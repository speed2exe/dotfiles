function nc
    sed 's/\x1b\[[0-9;]*[a-zA-Z]//g' $argv
end
