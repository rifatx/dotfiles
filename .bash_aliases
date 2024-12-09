#
# ~/.bash_aliases
#

alias md='mkdir'
alias ls='ls --color=auto'
alias ll='ls -lath'
alias grep='grep --color=auto'
#alias ec='nohup emacsclient -c . 1>/dev/null 2>/dev/null &'

alias vb_rdp='(echo 'Y' | nohup xfreerdp /bpp:16 /gfx +aero +fonts +gestures -grab-keyboard -grab-mouse /d:${VB_DOMAIN} /u:${VB_USER} /p:${VB_PASSWORD} /h:1060 /w:1920 /v:${VB_HOSTNAME} 1>/dev/null 2>/dev/null) &'

alias btcon_r-buds='bluetoothctl connect ${MAC_R_BUDS}'

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history

