function bind_ctrl_z
    set job (jobs | fr | cut -f 2) && fg $job
end
