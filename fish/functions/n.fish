function n
    set dir (dirh | sed \$d | tac | fr --no-sort --ansi)
    set dir (string split --max 1 --right ' ' $dir)
    commandline $dir[-1]'/'
end
