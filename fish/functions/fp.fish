function fp --wraps=fzf\ --ansi\ -i\ --preview\ \'echo\ \"show\ \{\}\"\ \|\ fish\' --description alias\ fp\ fzf\ --ansi\ -i\ --preview\ \'echo\ \"show\ \{\}\"\ \|\ fish\'
  fzf --ansi -i --preview 'echo "show {}" | fish' $argv; 
end
