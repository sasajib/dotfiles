#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bash_aliases

HISTSIZE=2000

# PS1='[\u@\h \W]\$ '

prompt='$'
[[ $(whoami) == 'root' ]] && prompt='#'

git_branch() {
  branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  if [[ ! -z $branch ]]; then
    branch=" (${branch})"
  fi
  echo "$branch"
}

PS1="\[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;32m\]@\h\[\033[1;33m\]\$(git_branch)$prompt \[\033[0m\]"

# auto-cd with just a path name
shopt -s autocd

# line wrap on window resize
shopt -s checkwinsize


export EDITOR='vim'
export BROWSER='w3m'
export GOPATH=~/work/go
export PATH=$PATH:~/work/go/bin
export QT_SCALE_FACTOR=2
export ANDROID_HOME='/home/sergiu/Android/Sdk'
export ANDROID_AVD_ROOT='/home/sergiu/Android/Sdk'
export ANDROID_SDK_ROOT='/home/sergiu/Android/Sdk'
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

source /etc/profile.d/autojump.bash

# Powerline
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

function up {
  for _ in $(seq 1 $1); do
    cd ..
  done
}

function swap {
  tmp=$(mktemp)
  mv $1 $tmp
  mv $2 $1
  mv $tmp $2
}

function search {
  find . -iname "*$1*"
}

function tmx {
  name=$1
  if tmux list-sessions | grep -q "^${name}:"; then
    tmux attach -t "${name}"
  else
    tmux new-session -s "${name}"
  fi
}

function download {
  wget -r -np -R "index.html*" $1
}

# source /usr/share/nvm/init-nvm.sh

[[ -z "$TMUX" ]] && tmux

# task ls

# added by travis gem
[ -f /home/sergiu/.travis/travis.sh ] && source /home/sergiu/.travis/travis.sh
