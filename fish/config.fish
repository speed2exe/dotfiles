# optionally source from home directory if any
# usually platform specific config
test -f ~/.init.fish && source ~/.init.fish

status is-interactive && source ~/.config/fish/interactive.fish &
