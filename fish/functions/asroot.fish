function asroot
  set last (history -n 1) && fish -c "doas $last $argv"
end
