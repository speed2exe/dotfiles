# local binaries
fish_add_path "~/.local/bin"

# set environment variables
set -x SHELL "$(which fish)"

# return if not interactive
not status is-interactive && return

# source interactive fish config file
source ~/.config/fish/interactive.fish
