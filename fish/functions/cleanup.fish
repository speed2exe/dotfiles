function cleanup
    cat ~/marks/dir_history.txt > /tmp/dir_history_temp
    cat /tmp/dir_history >> /tmp/dir_history_temp
    tail -n 1000 /tmp/dir_history_temp > ~/marks/dir_history.txt
    rm /tmp/dir_history
    rm /tmp/dir_history_temp
end
