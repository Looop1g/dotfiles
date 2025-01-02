# $HOME/.bashrc

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain fr>
# outputting anything in those cases.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Put your fun stuff here.
alias grep='grep --color=auto'
alias ll='ls -alh --color=auto'

#
# Bash 设置
#

# Bash 显示 git 分支
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Bash 的自动补全
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
  . /usr/share/bash-completion/bash_completion

# Bash 的美化
export PS1="\[\033[1;35m\]  \u\[\033[1;34m\]\$(parse_git_branch) \[\033[0;36m\]\w\[\033[0m\]\n\[\033[0m\]\[\033[1;31m\] \[\033[0m\]"

# Configure completion for doas
# -c : Complete arguments as if they were commands
#     (eg: `doas emer<tab>` -> `doas emerge`)
#     (eg: `doas dd status=p<tab>` -> `doas dd status=progress`)
# -f : Complete arguments as if they were directory names (default behaviour)
#     (eg: `doas /bi<tab>` -> `doas /bin/`)
complete -cf doas
