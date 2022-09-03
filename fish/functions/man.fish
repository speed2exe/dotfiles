function man
    command man "$argv" &| nvim -c "set syntax=man"
end
