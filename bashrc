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
export PS1="\n\[\033[1;35m\]  \u\[\033[1;34m\]\$(parse_git_branch) \[\033[0;36m\]\w\[\033[0m\]\n\[\033[0m\]\[\033[1;31m\] \[\033[0m\]"


# 其他配置
# Miniconda3 的配置
export PATH=$PATH:/opt/miniconda3/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Configure completion for doas
# -c : Complete arguments as if they were commands
#     (eg: `doas emer<tab>` -> `doas emerge`)
#     (eg: `doas dd status=p<tab>` -> `doas dd status=progress`)
# -f : Complete arguments as if they were directory names (default behaviour)
#     (eg: `doas /bi<tab>` -> `doas /bin/`)
complete -cf doas
