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
	case "insert"
		echo -en "\e[6 q"
	case "*"
		echo -en "\e[2 q"
	end
end

# neofetch && set_color brblack; fortune
echo
set_color brblack ; fortune ; set_color normal

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

# display todos if not empty
test -f ~/.todo.md || touch ~/.todo.md
cat ~/.todo.md

# keybinding to emulate yank line and paste in vi mode
bind yy fish_clipboard_copy
bind p fish_clipboard_paste

# keybinding for switching jobs
bind -M insert \cz 'z'
bind \cz 'z'

# keybinding to kill all background jobs
bind -M insert \cq 'q'
bind \cq 'q'

# optionally source from home directory if any
test -f ~/.init.fish && source ~/.init.fish

# keybindings to insert into current line
bind --mode insert \cf 'commandline --append (f) && commandline --function repaint-mode'
bind --mode insert \ct 'commandline --append (t) && commandline --function repaint-mode'
bind --mode insert \ch 'commandline --insert (h) && commandline --function repaint-mode'
