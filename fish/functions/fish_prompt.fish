function fish_prompt
    set last_status $status

    if test -n "$NIX_SHELL_STACK"
	set COUNT (echo "$NIX_SHELL_STACK" | wc --words)
	set_color -b blue ; printf " $COUNT " ; set_color normal
    end

    set job_list (jobs)
    if success
        set_color -b brblack ; printf " $(count $job_list) " ; set_color normal
    end

    starship prompt

    if test $last_status -eq 0
        set_color -b green ; printf " " ; set_color normal
    else
        set_color -b red black ; printf " $last_status " ; set_color normal
    end

    printf " "
end
