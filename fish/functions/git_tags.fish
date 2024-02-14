function git_tags
  git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags | column --table
end
