# set container prompt to time/user@<imagetag>\n pwd
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\][\t]\[\033[00m\] \[\033[01;34m\]$DEVENV\[\033[00m\]\n\[\033[1;36m\]\w\[\033[00m\]\$ '

# Use vi mode on the shell
set -o vi

# turn on ls colors for GNU ls
eval "$(dircolors -b)"
alias ls='ls --color=auto'

# Add a home bin to the path
PATH=$HOME/bin:$PATH



