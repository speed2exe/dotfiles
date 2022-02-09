function mkzip
    if test (count $argv) -ne 1
        echo "requires 1 arg: path to file/folder"
    end

    commandline "zip -vr $argv.zip $argv"
end
