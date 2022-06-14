# homebrew
fish_add_path "/opt/homebrew/bin"

# node@16
set -l node_16_path "/opt/homebrew/Cellar/node@16/"
set -l node_16_versions (ls $node_16_path)
if test -n "$node_16_versions"
	fish_add_path "$node_16_path$node_16_versions[1]/bin"
end

# openjdk
set -l open_jdk_path "/opt/homebrew/Cellar/openjdk/"
set -l open_jdk_versions (ls $open_jdk_path)
if test -n "$open_jdk_versions"
	set -x JAVA_HOME "$open_jdk_path$open_jdk_versions[1]/bin"
end
