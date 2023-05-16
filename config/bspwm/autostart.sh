#!/bin/bash
pgrep -x picom >/dev/null || picom --config $HOME/.config/picom/picom.conf &
pgrep -x fcitx5 >/dev/null || fcitx5 &
pgrep -x clash >/dev/null || clash &
pgrep -x flameshot >/dev/null || flameshot &
pgrep -x gentoo-pipewire-launcher >/dev/null || gentoo-pipewire-launcher &

sleep 10
pgrep -x dropbox >/dev/null || dropbox &
