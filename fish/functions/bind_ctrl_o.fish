function bind_ctrl_o
  nvim -c "redir! > /tmp/vimoldfiles" -c "silent oldfiles" -c "redir END" -c "q"
  set path (cat /tmp/vimoldfiles | sed '1d' | awk -F ": " '{print $2 ":" $1}' | rg '^/' | fp)
  if success
    v $path
  end
end
