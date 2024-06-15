function nvim
    if type -q neovide
        if test -z "$argv"
            command neovide
        else if string match -- '-*' $argv[1] > /dev/null
            command neovide -- $argv
        else
            command neovide $argv[1] -- $argv[2..]
        end
    else
        command nvim $argv
    end
end
