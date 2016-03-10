# vim:ft=sh

alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -la'

alias mkdir='mkdir -pv'

alias ..='cd ..'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

alias tmux='TERM=xterm-256color /usr/bin/tmux'

# fasd aliases
alias v='f -e vim'

# aliases for php cli
# php command-line applications (like composer) should run with xdebug disabled,
# unless they are executed specificly with php before the script.
#
# phpunit needs xdebug for profiling, so we alias phpunit to be prepended with `php`.
alias php='php -dzend_extension=xdebug.so'
alias phpunit='php $(which phpunit)'

# load database aliases if any
if [ -f ~/.database_aliases ]; then
	. ~/.database_aliases
fi

