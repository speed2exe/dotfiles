function bind_ctrl_n
	# tac ~/marks/dir_history.txt | awk '!x[$0]++' > /tmp/dir_history.txt
	# set dir (cat /tmp/dir_history.txt | fp --no-sort)
     	# commandline --insert $dir
     	# commandline --function repaint-mode

	n
	commandline --function repaint
end
