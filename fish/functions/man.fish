function man
    command man "$argv" > /tmp/.man
    and cat /tmp/.man | ansifilter | nvim -c "set syntax=man"
    rm /tmp/.man
end
