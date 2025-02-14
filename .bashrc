#
# ~/.bashrc
#

cd ${HOME} 

export EDITOR=vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

CD="$(dirname $(realpath ${HOME}/.bashrc))"

export CD

if [ -f "${HOME}/.r-env" ]; then
    source "${HOME}/.r-env"
fi

if [ -f "${CD}/.bash_aliases" ]; then
    source "${CD}/.bash_aliases"
fi

PS1='[\u@\h \W]\$ '

PATH="$PATH:/opt/android-platform-tools"
PATH="$PATH:/opt/dotnet/current"
PATH="$PATH:/home/r/.dotnet/tools"
export DOTNET_ROOT="/opt/dotnet/current"

export JAVA_HOME="/usr/local/jvm/current"
PATH="$PATH:/usr/local/jvm/current/bin"

PATH="$PATH:/mnt/data/jetbrains/scripts"

[ -f ${HOME}/.fzf.bash ] && source ${HOME}/.fzf.bash

if [ -f ${HOME}/.git-completion.bash ]; then
  source ${HOME}/.git-completion.bash
fi

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

if type "docker" > /dev/null; then
  source <(docker completion bash)
fi

if [ -f "${CD}/.ssh_completion" ]; then
  source "${CD}/.ssh_completion"
fi

if [ -f "${CD}/lscolors.sh" ]; then
  source "${CD}/lscolors.sh"
fi

export PATH

export VIRTUAL_ENV_DISABLE_PROMPT=1

#BLUE="\[\e[38;5;25m\]"
#D_GREEN="\[\e[38;5;34m\]"
#L_GREEN="\[\e[38;5;49m\]"
#ORANGE="\[\e[38;5;166m\]"
#L_YELLOW="\[\e[38;5;228m\]"
#ERR_RED="\[\e[38;5;160m\]"
#OK_GREEN="\[\e[38;5;46m\]"
#COL_RES="\[\e[38;5;$(($?==0?46:160))m\]"

PS0='${PS1:$((PS0time=\D{%s}, PS1calc=1, 0)):0}'

PROMPT_COMMAND='PS1_GITCMD="$(b=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2); [[ ${#b} -gt 0 ]] && gu=$(git ls-files --others --exclude-standard | wc -l) && gm=$(git --no-pager diff --name-only --diff-filter=M | wc -l) && gs=$(git diff --cached --numstat | wc -l) && gd=$(git --no-pager diff --name-only --diff-filter=D | wc -l) && echo -n -e "${b}\e[38;5;11m?${gu}\e[38;5;253m~${gm}\e[38;5;10m+${gs}\e[38;5;9m-${gd} ")";PS1_VENVCMD="$(v=${VIRTUAL_ENV##*/}; [[ ${#v} -gt 0 ]] && echo -n "(${v}) ")"'

PS1='\[\e[38;5;25m\]┌[\[\e[38;5;34m\]\[\e[38;5;228m\]\t \[\e[38;5;34m\]\u@\h \[\e[38;5;49m\]\w \[\e[38;5;166m\]${PS1_GITCMD}\[\e[38;5;33m\]${PS1_VENVCMD}\[\e[38;5;$(($?==0?46:160))m\]($(((${PS1calc:-0}) ? \D{%s}-${PS0time:-0} : 0))s$(r=$? && [[ ${r} -ne 0 ]] && echo -n "|${r}"))\[\e[38;5;25m\]]\r\n\[\e[38;5;25m\]└\[\e[38;5;$(($EUID==0?9:34))m\]\$ \[\e[38;5;34m\]${PS0:$((PS1calc=0, 0)):0}'

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd --hook pwd bash)"
fi



export PATH=/home/r/bin:$PATH

[[ -e "/home/r/Programs/oci-cli/lib/python3.11/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/r/Programs/oci-cli/lib/python3.11/site-packages/oci_cli/bin/oci_autocomplete.sh"

export VIDIR_EDITOR_ARGS='-c :set nolist | :set ft=vidir-ls'

