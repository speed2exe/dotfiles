function fish_greeting
    if test -f /tmp/.cmdln
        commandline (cat /tmp/.cmdln)
        rm /tmp/.cmdln
    end
end
