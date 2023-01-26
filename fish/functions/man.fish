function man
    command man "$argv" > /tmp/.man
    and cat /tmp/.man | nvim -c "set syntax=man"
    and rm /tmp/.man
end
