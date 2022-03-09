function asroot --wraps='set last (history -n 1) && commandline "doas $last"' --description 'alias asroot set last (history -n 1) && commandline "doas $last"'
  set last (history -n 1) && fish -c "doas $last $argv";
end
