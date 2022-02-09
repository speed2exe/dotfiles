function gd --wraps=commandline\ \(tac\ \~/marks/directories.txt\ \|\ fpr\)\'/\' --description alias\ gd\ commandline\ \(tac\ \~/marks/directories.txt\ \|\ fpr\)\'/\'
  commandline (tac ~/marks/directories.txt | fpr)'/' $argv; 
end
