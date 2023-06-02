function n
    set dir (tac ~/marks/dir_history.txt | tee /tmp/dir_history.txt | fp --no-sort)
    and builtin cd $dir
    and tac /tmp/dir_history.txt | awk '!x[$0]++' > ~/marks/dir_history.txt
    and echo $dir >> ~/marks/dir_history.txt
end
