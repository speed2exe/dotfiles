function nvim
    if type -q neovide
        command neovide --multigrid $argv
    else
        command nvim $argv
    end
end
