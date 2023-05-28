function bind_ctrl_z
    set items (jobs)

    test -z "$items" && return

    if test (count $items) -eq 1
        fg (echo "$items" | cut -f 2)
        echo
        commandline --function repaint
        return
    end

    set job (jobs | fr --bind ctrl-z:abort)
    set pid (echo $job | cut -f 2)
    if test -n "$pid"
        fg $pid
    end
    echo
    commandline --function repaint
end
