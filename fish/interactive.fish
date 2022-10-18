set TERM xterm-256color
set fish_term24bit 1

# apply dracula theme
source ~/.config/fish/functions/dracula.fish

# VI Key Bindings
fish_vi_key_bindings

# Print some stuff
echo
set_color brblack ; fortune ; set_color normal
echo

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

# optionally source from home directory if any
test -f ~/.init.fish && source ~/.init.fish

# keybindings to insert into current line
bind --mode insert \cf 'bind_ctrl_f'
bind --mode insert \ch 'bind_ctrl_h'
bind --mode insert \cn 'bind_ctrl_n'
bind --mode insert \ct 'bind_ctrl_t'
bind --mode insert \cd 'bind_ctrl_d'

# keybinding for handling background jobs
bind --mode insert \cz 'bind_ctrl_z'
bind --mode insert \cq 'bind_ctrl_q'
