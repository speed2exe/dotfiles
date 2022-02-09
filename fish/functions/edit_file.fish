function edit_file
    if [ $argv ]
        commandline "nvim $argv"
    end
end
