function fish_greeting
    # put command if there is
    set cmdln (cat /tmp/.cmdln)
    if test -n "$cmdln"
        echo $cmdln
        commandline $cmdln
        :> /tmp/.cmdln
    end
end
