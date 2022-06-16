function print_boxed
    set text "$argv"
    set len (string length "$text")
    set dashes (string repeat --count (math "$len + 2") "─")
    set top "┌$dashes┐"
    set content "│ $text │"
    set bottom "└$dashes┘"
    printf "$top\n$content\n$bottom"
end
