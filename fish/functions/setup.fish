function setup
    touch /tmp/.savedir \
        /tmp/.cmd \
        /tmp/.cmdln

    # load from save_dir
    cd (cat /tmp/.savedir)
    :> /tmp/.savedir

    # execute command if there is
    set cmd (cat /tmp/.cmd)
    if test -n "$cmd"
        for ln in $cmd
            set c (string split ' ' $ln)
            $c
        end
        :> /tmp/.cmd
    end
end
