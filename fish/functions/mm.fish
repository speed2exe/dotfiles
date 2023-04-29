function mm
    inotifywait --monitor --event modify --recursive $argv[1] | while read -l line
        echo $line
        $argv[2..]
    end
end
