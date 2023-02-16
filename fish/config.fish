# optionally source from home directory if any
# usually platform specific config
test -f ~/.init.fish && source ~/.init.fish

# return if not interactive
not status is-interactive && return

# source interactive fish config file
source ~/.config/fish/interactive.fish &
