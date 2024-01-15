function fish_mode_prompt
	switch $fish_bind_mode
		case "visual"
			set_color black -b magenta; printf " " ; set_color normal;
		case "insert"
			set_color black -b green; printf " " ; set_color normal;
		case "replace"
			set_color black -b yellow; printf " " ; set_color normal;
		case "*"
			set_color black -b blue; printf " "; set_color normal;
	end
end
