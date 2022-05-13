# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        startx
    end
end

# local binaries
fish_add_path "~/.local/bin"

# return if not interactive
not status is-interactive && return

set TERM xterm-256color
set fish_term24bit 1

# apply dracula theme
source ~/.config/fish/functions/dracula.fish

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

# neofetch && set_color brblack; fortune
echo
set_color brblack; fortune

# cd to .savedir if exists
if test -f /tmp/.savedir
	cd (cat /tmp/.savedir)
	rm /tmp/.savedir
end

# run .cmd if exists
if test -f /tmp/.cmd
	mv /tmp/.cmd /tmp/.cmd.tmp
	fish /tmp/.cmd.tmp
	rm /tmp/.cmd.tmp
end

# keybinding to emulate yank line and paste in vi mode
bind yy fish_clipboard_copy
bind p fish_clipboard_paste
