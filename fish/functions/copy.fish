function copy
  if [ (count $argv) -eq 0 ]
    read -z > ~/.clipboard
  else
    $argv > ~/.clipboard
  end
end
