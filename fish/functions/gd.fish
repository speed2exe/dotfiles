function gd --wraps=commandline\ \(tac\ \~/marks/directories.txt\ \|\ fpr\)\'/\' --description alias\ gd\ commandline\ \(tac\ \~/marks/directories.txt\ \|\ fpr\)\'/\'
  commandline (cat ~/marks/directories.txt | fpr)'/' $argv; 
end
