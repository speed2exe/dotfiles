function c
    set path (fd_all --type directory . $argv | fpr)
    and cd $path
end
