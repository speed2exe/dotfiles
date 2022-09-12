function fish_mode_prompt
	switch $fish_bind_mode
    case "visual"
        set_color -b magenta; printf " " ; set_color normal;
	case "insert"
        set_color -b green; printf " " ; set_color normal; echo -en "\e[6 q"
	case "default"
        set_color -b blue; printf " " ; set_color normal; echo -en "\e[2 q"
	case "replace"
        set_color -b yellow; printf " " ; set_color normal;
    case "*"
        set_color -b white black; printf " $fish_bind_mode "; set_color normal;
	end
end
