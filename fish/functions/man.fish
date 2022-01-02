function man --description "wrap the 'man' manual page opener to use color in formatting"
  # based on this group of settings and explanation for them:
  # http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
  # converted to Fish shell syntax thanks to this page:
  # http://askubuntu.com/questions/522599/how-to-get-color-man-pages-under-fish-shell/650192

  # start of bold:
  set -x LESS_TERMCAP_md (set_color --bold blue)
  # end of all formatting:
  set -x LESS_TERMCAP_me (set_color cyan)

  # start of standout (inverted colors):
  set -x LESS_TERMCAP_so (set_color --reverse)
  # end of standout (inverted colors):
  set -x LESS_TERMCAP_se (set_color normal)
  # (no change – I like the default)

  # start of underline:
  set -x LESS_TERMCAP_us (set_color --underline)
  # end of underline:
  set -x LESS_TERMCAP_ue (set_color cyan)
  # (no change – I like the default)

  command man $argv
end
