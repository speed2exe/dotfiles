function n
    set dir (cat ~/marks/dir_history.txt | fr)
    if [ $status -eq 0 ]
        $dir/
    end
end
