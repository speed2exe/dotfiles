function man
    command man "$argv" | ansifilter > /tmp/.man
    and cat /tmp/.man | nvim -c "set syntax=man"
    rm /tmp/.man
end
