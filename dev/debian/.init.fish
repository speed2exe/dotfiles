fish_add_path /usr/games
fish_add_path /root/neovim/squashfs-root

function cat $argv
    batcat --theme=Dracula $argv
end
