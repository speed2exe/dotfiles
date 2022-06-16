function prompt
    set question "$argv"
    set answer (string trim (read --line --prompt-str "$question (y/n) "))
    if test "$answer" = "y"
        return 0
    end
    return 1
end
