#!/usr/bin/env bash

while [ ! -z "$(pgrep polybar)" ]; do
	killall polybar
done

polybar -q main -c "$HOME/.config/polybar/config.ini"
