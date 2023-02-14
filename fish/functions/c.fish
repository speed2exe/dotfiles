function c
    set path (fd_all --type directory . $argv | fp)
    and cd $path
end
