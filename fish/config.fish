# local binaries
fish_add_path "~/.local/bin"

# return if not interactive
not status is-interactive && return

# source interactive fish config file
source ~/.config/fish/interactive.fish
