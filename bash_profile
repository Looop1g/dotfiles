# $HOME/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.

# 加载用户目录下的 .bashrc 文件
if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

# 系统环境变量
export LANGUAGE="zh_CN.UTF-8" # 设置系统语言为中文

# fcitx5 全局变量
# alacritty 中 fcitx5 UI 不同是由于 alacritty 使用的就是 xim 架构
export XMODIFIERS=@im=fcitx5

# aliyunpan 下载的文件地址
export ALIYUNPAN_CONFIG_DIR=/home/looopig/Downloads/aliyunpan

# 登录用户自动 startx 进入窗口管理器
# 只有在使用 bspwm 等窗口管理器的时候才使用
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#	startx
#fi
