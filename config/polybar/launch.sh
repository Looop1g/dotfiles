#!/usr/bin/env bash

while [ ! -z "$(pgrep polybar)" ]; do
	killall polybar
done

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q main -c "$HOME/.config/polybar/config.ini"
