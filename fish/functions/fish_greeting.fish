function fish_greeting
    # load from save_dir
    cd (cat ~/.savedir)
    :> ~/.savedir

    # execute command if there is
    set cmd (cat ~/.cmd)
    if test $cmd
        $cmd
        :> ~/.cmd
    else
        echo
        neofetch && set_color brblack; fortune
    end
end
