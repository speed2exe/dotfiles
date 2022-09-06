function fish_prompt
    set last_status $status
    starship prompt
    if test $last_status -eq 0
        set_color -b green black ; printf " " ; set_color normal
    else
        set_color -b red black ; printf " $last_status " ; set_color normal
    end
    printf " "
end
