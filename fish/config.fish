# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx
    end
end

if status is-interactive
    source ~/.config/fish/interactive/functions.fish &
    source ~/.config/fish/interactive/alias.fish &

    set TERM xterm-256color
    set fish_term24bit 1

    clear

    # https://starship.rs/
    starship init fish | source
    set STARSHIP_CONFIG "~/.config/starship.toml"

    # VI Key Bindings
    fish_vi_key_bindings
    function fish_mode_prompt
        switch $fish_bind_mode
        case default
            echo -en "\e[2 q"
        case insert
            echo -en "\e[6 q"
        end
    end
end

# local binaries
fish_add_path "~/.local/bin"

# Go
#fish_add_path /usr/local/go/bin
#fish_add_path /usr/lib/go/bin
#set GOPATH $HOME/go
#fish_add_path $GOROOT/bin
#fish_add_path $GOPATH/bin

# Ruby
fish_add_path "/root/.local/share/gem/ruby/3.0.0/bin"
