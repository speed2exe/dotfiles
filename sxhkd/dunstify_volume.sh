volume=$(pacmd list-sinks | /bin/grep -A 15 '* index' | awk '/volume: front/{ print $5 }' | sed 's/[%|,]//g')
mute=$(pacmd list-sinks | /bin/grep -A 15 '* index' | awk '/muted:/{ print $2 }')

dunstify --timeout=512 --replace=456 volume:\ $volume \mute:\ \ \ \ \ $mute
