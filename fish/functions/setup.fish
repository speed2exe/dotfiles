function setup
    # cd to .savedir if exists
    if test -f /tmp/.savedir
        cd (cat /tmp/.savedir)
        rm /tmp/.savedir
    end

    # run .cmd if exists
    if test -f /tmp/.cmd
        mv /tmp/.cmd /tmp/.cmd.tmp
        fish /tmp/.cmd.tmp
        rm /tmp/.cmd.tmp
    end

    # keybinding to emulate yank line and paste in vi mode
    bind yy fish_clipboard_copy
    bind p fish_clipboard_paste
end
