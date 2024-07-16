#
# ~/.bash_aliases
#

alias md='mkdir'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
#alias ec='nohup emacsclient -c . 1>/dev/null 2>/dev/null &'

function f_vm_rdp() {
  if [ -z "${VM_PASSWORD}" ]; then
    echo 'VM password (VM_PASSWORD) not set'
    return 1
  fi

  if [ -z "${VM_VMX_PATH}" ]; then
    echo 'VM path (VM_VMX_PATH) not set'
    return 1
  fi

  nVM=$(vmrun list | grep "$VM_VMX_PATH" | wc -l)

  if [ ${nVM} == 0 ]; then
    echo "VM '${VM_VMX_PATH}' not running"
    return 1
  fi

  (echo 'yes' | nohup rdesktop -K -k tr -a 8 -x m -u "${VM_USERNAME}" -p "${VM_PASSWORD}" $(vmrun -vp ${VM_ENCRYPTION_PASSWORD} getGuestIPAddress "${VM_VMX_PATH}" -wait) 1>/dev/null 2>/dev/null) &
}

alias vm_start='vmrun -T ws -vp ${VM_ENCRYPTION_PASSWORD} start ${VM_VMX_PATH} nogui'
alias vm_stop='vmrun -T ws -vp ${VM_ENCRYPTION_PASSWORD} stop ${VM_VMX_PATH} nogui'
alias vm_rdp='f_vm_rdp'

alias vb_rdp='(echo 'Y' | nohup xfreerdp /bpp:16 /gfx +aero +fonts +gestures -grab-keyboard -grab-mouse /d:${VB_DOMAIN} /u:${VB_USER} /p:${VB_PASSWORD} /h:1060 /w:1920 /v:${VB_HOSTNAME} 1>/dev/null 2>/dev/null) &'


alias btcon_r-buds='bluetoothctl connect ${MAC_R_BUDS}'

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
