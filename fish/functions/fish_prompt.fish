function fish_prompt
    set last_status $status

    set job_list (jobs)
    if success
        set_color -b brblack black ; printf " (count $job_list) " ; set_color normal
    end

    starship prompt

    if test $last_status -eq 0
        set_color -b green ; printf " " ; set_color normal
    else
        set_color -b red black ; printf " $last_status " ; set_color normal
    end

    printf " "
end
