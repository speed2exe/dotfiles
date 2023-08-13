function man
    command man "$argv" | ansifilter > /tmp/.man
    nvim -c "set syntax=man" /tmp/.man
end
