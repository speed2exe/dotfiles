function savedir --wraps='echo (pwd) > ~/.savedir' --description 'alias savedir echo (pwd) > ~/.savedir'
  echo (pwd) > /tmp/.savedir $argv; 
end
