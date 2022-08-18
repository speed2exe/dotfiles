# jdtls jvm args
set -x JDTLS_JVM_ARGS "-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar -Xbootclasspath/a:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"

# homebrew
fish_add_path "/usr/local/bin"

# homebrew
fish_add_path "/opt/homebrew/bin"

# node@16
fish_add_path "/opt/homebrew/opt/node@16/bin"

# openjdk
set -x JAVA_HOME "/opt/homebrew/opt/openjdk"
