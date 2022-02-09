function learn
  printf "$argv" | sed "s/ /\//g" | xargs -I {} curl cht.sh/{}
end
