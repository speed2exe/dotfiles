# homebrew
fish_add_path "/opt/homebrew/bin"

# node@16
set -l node_16 (ls "/opt/homebrew/Cellar/node@16/")
if test -n "$node_16"
	fish_add_path "$node_16[1]/bin"
end

# openjdk
set -l open_jdk (ls "/opt/homebrew/Cellar/openjdk/")
if test -n "$open_jdk"
	fish_add_path "$open_jdk[1]/bin"
end
