function mkzip
    if test (count $argv) -ne 1
        set_color red; echo "requires 1 arg: path to file/folder"
    end

    set target (string trim --right --chars=/ $argv)
    commandline "zip -vr $target.zip $argv"
end
