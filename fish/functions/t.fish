function t
    set splitted (string split --right --max 1 / $argv)
    if [ (count $splitted) -eq 1 ]
        touch $argv
    else
        mkdir -p $splitted[1] && touch $argv
    end
end
