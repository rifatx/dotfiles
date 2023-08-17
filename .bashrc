#
# ~/.bashrc
#

export EDITOR=emacsclient

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ec='nohup emacsclient -c . 1>/dev/null 2>/dev/null &'

PS1='[\u@\h \W]\$ '

PATH="$PATH:/opt/android-platform-tools"
PATH="$PATH:/opt/dotnet/current"

export DOTNET_ROOT="/opt/dotnet/current"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

source .r-env

alias btcon_r-buds='bluetoothctl connect ${MAC_R_BUDS}'
