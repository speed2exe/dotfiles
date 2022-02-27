function setup
    touch /tmp/.savedir \
        /tmp/.cmd \
        /tmp/.cmdln

    # load from save_dir
    cd (cat /tmp/.savedir)
    :> /tmp/.savedir

    # execute command if there is
    fish /tmp/.cmd
    :> /tmp/.cmd
end
