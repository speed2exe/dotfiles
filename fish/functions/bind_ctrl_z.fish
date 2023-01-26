function bind_ctrl_z
    set items (jobs)

    test -z "$items" && return

    if test (count $items) -eq 1
        fg (echo "$items" | cut -f 2)
        echo
        commandline --function repaint
        return
    end

    set job (jobs | fr | cut -f 2) && fg $job
    echo
    commandline --function repaint
end
