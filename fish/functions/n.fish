function n
    tac ~/marks/dir_history.txt | awk '!x[$0]++' > /tmp/dir_history.txt
    set dir (cat /tmp/dir_history.txt | fp --no-sort)
    and builtin cd $dir
    and tac /tmp/dir_history.txt > ~/marks/dir_history.txt
    and echo $dir >> ~/marks/dir_history.txt
end
