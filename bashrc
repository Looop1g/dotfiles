# $HOME/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# 在查询 grep 与 ls 中使用颜色进行区分
alias grep='grep --color=auto'
alias ls='ls --color=auto'

#
# Bash 设置
#

# Bash 显示 git 分支
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Bash 的自动补全
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Bash 的美化
export PS1="\n\[\033[1;35m\]  \u\[\033[1;34m\]\$(parse_git_branch) \[\033[0;36m\]\w\[\033[0m\]\n\[\033[0m\]\[\033[1;31m\] \[\033[0m\]"
