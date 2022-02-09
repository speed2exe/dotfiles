function c
    if [ ! (count $argv) -eq 1 ]
        echo "count must be 1"
        return
    end

    set trimmed (string trim --right --chars "/" $argv)
    if [ $status -eq 0 ] # is path
        commandline "mkdir -p $trimmed"
    else
        t $argv
    end
end
