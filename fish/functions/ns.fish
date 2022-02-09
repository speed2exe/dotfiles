function ns --wraps='cat (lookup_file ~/notes)' --description 'alias ns cat (lookup_file ~/notes)'
  cat (lookup_file ~/notes) $argv; 
end
