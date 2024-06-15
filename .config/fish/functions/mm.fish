function wait_change_then_run
    inotifywait --monitor --event modify --recursive . | while read -l line
        echo $line
        $argv
    end
end
