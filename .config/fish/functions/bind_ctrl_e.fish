function bind_ctrl_e
   set cmd (commandline)
   test -n "$cmd" && nvim -c ":term $cmd"
end
