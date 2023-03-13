#!/bin/bash
pgrep -x picom > /dev/null || picom --config $HOME/.config/picom/picom.conf &
pgrep -x fcitx5 > /dev/null || fcitx5 &
pgrep -x dropbox >/dev/null || dropbox &
pgrep -x clash > /dev/null || clash &
pgrep -x flameshot > /dev/null || flameshot &
