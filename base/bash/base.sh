# Reset
Color_Off='\[\e[0m\]'       # Text Reset

# Colors will work nice when used with "Solarized" palette.
# Nothing new here
White='\[\e[0;37m\]'        # White
Green='\[\e[0;32m\]'        # Green
BWhite='\[\e[1;37m\]'       # White

# custom prompt.
# User input is colored in white
# the trap will reset the colors before execution of commands
PS1="${White}\t ${Green}\w${Color_Off} $ ${BWhite}"

# reset color after prompt
trap "echo -ne '\e[0m'" DEBUG

# set container prompt to time/user@<imagetag>\n pwd
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\][\t]\[\033[00m\] \[\033[01;34m\]$DEVENV\[\033[00m\]\n\[\033[1;36m\]\w\[\033[00m\]\$ '

# Use vi mode on the shell
set -o vi

# turn on ls colors for GNU ls
eval "$(dircolors $HOME/.dircolors)"
alias ls='ls --color=auto'

if [ -f /etc/bash_completion.d/git ]; then
  . /etc/bash_completion.d/git ]
fi

if [ -f /usr/local/etc/hub.bash_completion.sh ]; then
  . /usr/local/etc/hub.bash_completion.sh
  eval "$(hub alias -s)"
fi


