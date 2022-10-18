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

# source interactive fish config file
source ~/.config/fish/interactive.fish
