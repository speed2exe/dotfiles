function nvim
    if type -q neovide
        command neovide $argv
    else
        command nvim $argv
    end
end
