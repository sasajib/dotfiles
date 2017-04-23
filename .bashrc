#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bash_aliases

# PS1='[\u@\h \W]\$ '

prompt='$'
[[ $(whoami) == 'root' ]] && prompt='#'
PS1='\[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;32m\]@\h\[\033[1;33m\] $prompt \[\033[0m\]'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# auto-cd with just a path name
shopt -s autocd

# line wrap on window resize
shopt -s checkwinsize


export EDITOR='vim'
export BROWSER='w3m'
export GOPATH=~/work/go
export PATH=$PATH:~/work/go/bin

source /etc/profile.d/autojump.bash

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
