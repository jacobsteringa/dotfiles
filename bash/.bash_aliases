# vim:ft=sh

if [ "$(uname)" = "Darwin" ]; then
    alias ls='ls -FG'
else
    alias ls='ls -F --color=auto'
fi

alias ll='ls -l'
alias la='ls -la'

alias mkdir='mkdir -pv'

alias ..='cd ..'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

alias tmux='TERM=xterm-256color $(which tmux)'

# fasd aliases
alias v='f -e vim'

# aliases for php cli
# php command-line applications (like composer) should run with xdebug disabled,
# unless they are executed specificly with php before the script.
#
# phpunit needs xdebug for profiling, so we alias phpunit to be prepended with `php`.
alias php='php -dzend_extension=xdebug.so'
alias phpunit='php $(which phpunit)'

# load machine specific aliases if any
if [ -f ~/.extra_aliases ]; then
	. ~/.extra_aliases
fi
