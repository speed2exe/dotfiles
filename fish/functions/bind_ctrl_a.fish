function bind_ctrl_a
    nix-shell --command "fish --init-command='set -ax NIX_SHELL_STACK (pwd)'"
    or echo
    commandline --function repaint
end
