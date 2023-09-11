#
# ~/.bashrc
#

export EDITOR=emacsclient

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source .r-env

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ec='nohup emacsclient -c . 1>/dev/null 2>/dev/null &'

alias vm_start='vmrun -T ws start /mnt/data/vms/vmware/Win10/Windows10.vmx nogui'
alias vm_stop='vmrun -T ws stop /mnt/data/vms/vmware/Win10/Windows10.vmx nogui'
alias vm_rdp="nohup rdesktop -u r -p $VM_PASSWORD 192.168.2.18 1>/dev/null 2>/dev/null &"

PS1='[\u@\h \W]\$ '

PATH="$PATH:/opt/android-platform-tools"
PATH="$PATH:/opt/dotnet/current"

export DOTNET_ROOT="/opt/dotnet/current"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


alias btcon_r-buds='bluetoothctl connect ${MAC_R_BUDS}'

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
