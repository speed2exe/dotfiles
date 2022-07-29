function mkzip
    if test (count $argv) -ne 1
        error "requires 1 arg: path to file/folder"
    end

    set target (string trim --right --chars=/ "$argv")
    eval "zip -vr $target.zip $argv"
end
