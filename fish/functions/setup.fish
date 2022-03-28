function setup
    if test -f /tmp/.savedir
        cd (cat /tmp/.savedir)
        rm /tmp/.savedir
    end

    if test -f /tmp/.cmd
        mv /tmp/.cmd /tmp/.cmd.tmp
        fish /tmp/.cmd.tmp
        rm /tmp/.cmd.tmp
    end
end
