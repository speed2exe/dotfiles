function t
    set splitted (string split --right --max 1 / $argv)
    if [ (count $splitted) -eq 1 ]
        commandline "touch $argv"
    else
        commandline "mkdir -p $splitted[1] && touch $argv"
    end
end
