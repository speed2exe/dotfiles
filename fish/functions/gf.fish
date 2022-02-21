function gf
    set file (cat ~/marks/files.txt | fpr)
    set splitted (string split ":" $file) # account for line number if exists
    if [ (count $splitted) -ne 2 ]
        commandline "nvim $file"
    else
        commandline "nvim +$splitted[2] $splitted[1]"
    end
end
