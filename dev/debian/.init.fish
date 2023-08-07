fish_add_path /usr/games
fish_add_path /root/neovim/squashfs-root

function bat $argv
    batcat --theme=Dracula $argv
end

function fd $argv
    fdfind $argv
end
