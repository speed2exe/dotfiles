#
# ~/.bash_profile
#

# Login
[[ -z $DISPLAY && $XDG_VTNR ]] && return

# bashrc
. ~/.bashrc
