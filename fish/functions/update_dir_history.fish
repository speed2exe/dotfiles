function update_dir_history
    cat ~/marks/dir_history.txt /tmp/dir_history > /tmp/buffer
    tac /tmp/buffer | tail -n 1000 | awk '!x[$0]++' | tac > ~/marks/dir_history.txt
    rm /tmp/buffer
end
