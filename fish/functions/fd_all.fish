function fd_all --wraps='fd --hidden --no-ignore --color=always' --description 'alias fd_all fd --hidden --no-ignore --color=always'
  fd --hidden --no-ignore --color=always $argv; 
end
