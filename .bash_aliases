#
# ~/.bash_aliases
#

alias ls='ls --color=auto'
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

  (echo 'yes' | nohup rdesktop -K -k tr -u r -p "${VM_PASSWORD}" $(vmrun getGuestIPAddress "${VM_VMX_PATH}" -wait) 1>/dev/null 2>/dev/null) &
}

alias vm_start='vmrun -T ws start ${VM_VMX_PATH} nogui'
alias vm_stop='vmrun -T ws stop ${VM_VMX_PATH} nogui'
alias vm_rdp='f_vm_rdp'

alias btcon_r-buds='bluetoothctl connect ${MAC_R_BUDS}'

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
