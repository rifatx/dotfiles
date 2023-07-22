#
# ~/.bashrc
#

export EDITOR=emacsclient

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ec="emacsclient -c"
PS1='[\u@\h \W]\$ '

PATH="$PATH:/opt/android-platform-tools"
PATH="$PATH:/opt/dotnet/current"

export DOTNET_ROOT="/opt/dotnet/current"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

