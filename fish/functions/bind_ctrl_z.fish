function bind_ctrl_z
    set items (jobs)
    if test -z "$items"
        return
    end

    if test (count $items) -eq 1
        fg (echo "$items" | cut -f 2)
    end

    set job (jobs | fr | cut -f 2) && fg $job

    commandline --function repaint-mode
end
