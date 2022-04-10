function gf
    set file (cat ~/marks/files.txt | fpr)
    if test ! $status -eq 0
        return
    end

    set splitted (string split ":" $file) # account for line number if exists
    if [ (count $splitted) -ne 2 ]
        nvim $file
    else
        nvim +$splitted[2] $splitted[1]
    end
end
