function nc --wraps=sed\ \'s/\\x1b\\\[\[0-9\;\]\*\[a-zA-Z\]//g\' --description alias\ nc\ sed\ \'s/\\x1b\\\[\[0-9\;\]\*\[a-zA-Z\]//g\'
  sed 's/\x1b\[[0-9;]*[a-zA-Z]//g' $argv; 
end
