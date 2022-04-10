function fish_greeting
    if test -f /tmp/.cmdln
        set content (cat /tmp/.cmdln)
        printf $content | xclip -sel clip
        set_color yellow; echo "'$content' is in clipboard"
        rm /tmp/.cmdln
    end
end
