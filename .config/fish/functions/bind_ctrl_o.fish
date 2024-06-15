function bind_ctrl_o
  nvim -c "redir! > /tmp/vimoldfiles | silent oldfiles | redir END | q" > /dev/null
  set path (sed '1d' /tmp/vimoldfiles | awk -F ": " '{print $2}' | rg '^/' | fp)
  if success
    v $path
  end
end
