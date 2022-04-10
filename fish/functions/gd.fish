function gd
    set dir (cat ~/marks/directories.txt | fpr)'/'
    if test $status -eq 0
        $dir
    end
end
