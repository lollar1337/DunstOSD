#!/bin/bash
playerctl play-pause
playstatus=$(playerctl status)
title=$(playerctl metadata --format "{{ title }}")
artcover=$(playerctl metadata --format "{{ (mpris:artUrl) }}")
artist=$(playerctl metadata --format "{{ artist }}")
if [[ $playstatus == "Playing" ]]; then
	SYMBOL="󰐊"
fi

if [[ $playstatus == "Paused" ]]; then
	SYMBOL="󰏤"
fi

notify-send --icon $artcover  "$title" "$artist"
